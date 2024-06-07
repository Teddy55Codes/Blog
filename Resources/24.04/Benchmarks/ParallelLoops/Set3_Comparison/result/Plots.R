dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE, showWarnings = FALSE)
list.of.packages <- c("ggplot2", "ggthemes", "cowplot", "dplyr", "gdata", "tidyr", "grid", "gridExtra", "Rcpp", "R.devices", "stringr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, lib = Sys.getenv("R_LIBS_USER"), repos = "https://cran.rstudio.com/")
lapply(list.of.packages, library, character.only = TRUE)

std.error <- function(x) sqrt(var(x)/length(x))

addNumberSymbols <- function(x)
  ifelse(as.integer(x) >= 1000000, paste0(as.integer(x) / 1000000, " m"),
         ifelse(as.integer(x) >= 1000, paste0(as.integer(x) / 1000, " k"),
                x))

addTimeSymbols <- function(x)
  ifelse(x >= 1000000000, paste0(x / 1000000000, " sec"),
         ifelse(x >= 1000000, paste0(x / 1000000, " ms"),
                ifelse(x >= 1000, paste0(x / 1000, " us"),
                       paste0(x, " ns"))))

TimeMajorTicks <- function(factor, curr = numeric()) {
  factorNum <- as.integer(factor)
  if (is.na(factorNum) || factorNum < 1)
    return(curr)
  else
    return(TimeMajorTicks(factorNum - 1, c(10^(factorNum - 1), curr)))
}

TimeMinorTicks <- function(factor, curr = numeric()) {
  factorNum <- as.integer(factor)
  if (is.na(factorNum) || factorNum < 1)
    return(curr)
  else
    return(TimeMinorTicks(factorNum - 1, c(seq(10^(factorNum - 1) * 2, 10^(factorNum - 1) * 9, by = 10^(factorNum - 1)), curr)))
}

printFileSave <- function(filename) cat(paste0("Generated Plot: ", filename, "\n"))

formatLinePlot2ParamsData <- function(data) {
  data <- data %>% rowwise() %>% mutate(Iterations = sub(".*iterations=(\\d+).*", "\\1", Params, perl=TRUE))
  
  iterations <- as.integer(data$Iterations)
  sortedData <- data[order(iterations), ]
  
  sortedData$Target_Method <- factor(sortedData$Target_Method, levels = unique(sortedData$Target_Method))
  sortedData$Iterations <- factor(sortedData$Iterations, levels = unique(sortedData$Iterations))
  
  iterations <- as.integer(sortedData$Iterations)
  return(sortedData[order(iterations), ])
}

linePlot <- function(sortedData, framework)
  ggplot(sortedData, aes(x = Iterations, y = Value, group = Target_Method)) +
    geom_line(aes(color=Target_Method)) +
    geom_point(aes(color=Target_Method)) +
    ggtitle(paste("Results Parallel Loop Comparison ", framework)) +
    guides(color=guide_legend(title="Methods ")) +
    xlab("Iterations") +
    ylab("Time") +
    scale_y_log10(
      minor_breaks = TimeMinorTicks(10),
      breaks = TimeMajorTicks(11),
      labels = addTimeSymbols
    ) +
    scale_x_discrete(
      labels = addNumberSymbols
    )

linePlotForAllFrameworks <- function(sortedData, framework, showLegend)
  ggplot(sortedData, aes(x = Iterations, y = Value, group = Target_Method)) +
    geom_line(aes(color=Target_Method), show.legend = showLegend) +
    geom_point(aes(color=Target_Method), show.legend = showLegend) +
    ggtitle(paste("Results for ", framework)) +
    guides(color=guide_legend(title="Methods ")) +
    xlab("Iterations") +
    ylab("Time") +
    theme(plot.margin = unit(c(1.4, 0.2, 0, 0.2), units = "in"),
          legend.justification = "center",
          legend.box.margin = margin(-570, 0, 0, -180),
          legend.box.spacing =  unit(c(0, -1, 0, 1), units = "in")) +
    scale_y_log10(
      minor_breaks = TimeMinorTicks(10),
      breaks = TimeMajorTicks(11),
      labels = addTimeSymbols
    ) +
    scale_x_discrete(
      labels = addNumberSymbols
    )

# Read the CSV file
args <- commandArgs(trailingOnly = TRUE)
files <- if (length(args) > 0) args else list.files(path = "BenchmarkDotNet.Artifacts/results", pattern = "-measurements\\.csv$", full.names = TRUE)
for (file in files) {
  title <- gsub("-measurements.csv", "", basename(file))
  measurements <- read.csv(file, sep = ";")

  result <- measurements %>% filter(Measurement_IterationStage == "Result")
  if (nrow(result[is.na(result$Job_Id),]) > 0)
    result[is.na(result$Job_Id),]$Job_Id <- ""
  if (nrow(result[is.na(result$Params),]) > 0)
    result[is.na(result$Params),]$Params <- ""

  resultStats <- result %>%
    group_by_(.dots = c("Job_Runtime", "Target_Method", "Params")) %>%
    summarise(se = std.error(Measurement_Value), Value = mean(Measurement_Value))

  splitLists <- split(resultStats, list(resultStats$Job_Runtime))

  plotsForAllFrameworks <- list()
  i <- 1
  for (framework in names(splitLists)) {
    currentData <- splitLists[[framework]]
    frameworkFileName <- str_replace_all(framework, " ", "_")

    plot <- linePlot(formatLinePlot2ParamsData(currentData), framework)
    benchmarkName <- paste0("benchmark_Parallel_Loop_Comparison_", frameworkFileName, ".png")
    save_plot(benchmarkName, plot, base_height = 5, base_width = 10)
    printFileSave(benchmarkName)
    
    plotForAllFrameworks <- linePlotForAllFrameworks(formatLinePlot2ParamsData(currentData), framework, i == length(names(splitLists)))
    len <- length(plotsForAllFrameworks)
    plotsForAllFrameworks[[len+1]] <- plotForAllFrameworks

    i <- i + 1
  }
  
  benchmarkName <- "benchmark_Parallel_Loop_Comparison_AllFrameworks.png"
  save_plot(
    benchmarkName,
    do.call(
      plot_grid,
      args = list(
        plotlist = plotsForAllFrameworks,
        nrow = 1,
        labels = "Results for Parallel Loop Comparison",
        label_size = 20,
        label_x = -0.23,
        label_y = 0.94)),
    base_height = 8,
    base_width = 25)

  printFileSave(benchmarkName)
}
