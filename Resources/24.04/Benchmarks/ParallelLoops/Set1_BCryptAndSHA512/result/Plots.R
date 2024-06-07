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

# Sort the data frame based on cost and iterations as integers
sortBenchmarkTable <- function(data) {
  cost <- suppressWarnings(as.integer(sub(".*cost=(\\d+).*", "\\1", data$Params, perl=TRUE)))
  iterations <- as.integer(sub(".*iterations=(\\d+).*", "\\1", data$Params, perl=TRUE))
  data[order(cost, iterations), ]
}

formatLinePlotData <- function(data) {
  sortedData <- sortBenchmarkTable(data)

  # filter for 2 dimentional data
  sortedData <- dplyr::filter(sortedData, !grepl("&", Params), preserve = TRUE)

  sortedData$Params <- sub(".*iterations=(\\d+).*", "\\1", sortedData$Params, perl=TRUE)
  sortedData$Params <- factor(sortedData$Params, levels = unique(sortedData$Params))
  return(sortedData)
}

formatLinePlot2ParamsData <- function(data) {
  sortedData <- sortBenchmarkTable(data)

  # filter for 3 dimensional data
  sortedData <- dplyr::filter(sortedData, grepl("&", Params), preserve = TRUE)
  sortedData <- separate(sortedData, Params, into = c("Cost", "Iterations"), sep = "&")

  sortedData$Cost <- sub(".*cost=(\\d+).*", "\\1", sortedData$Cost, perl=TRUE)
  sortedData$Iterations <- sub(".*iterations=(\\d+).*", "\\1", sortedData$Iterations, perl=TRUE)
  
  sortedData$Target_Method <- factor(sortedData$Target_Method, levels = unique(sortedData$Target_Method))
  sortedData$Cost <- factor(sortedData$Cost, levels = unique(sortedData$Cost))
  sortedData$Iterations <- factor(sortedData$Iterations, levels = unique(sortedData$Iterations))
  return(sortedData)
}

allFrameworksPointPlot <- function(sortedData) 
  ggplot(sortedData, aes(x = Params, y = Value, group = Target_Method)) +
    geom_point(aes(color=Target_Method, shape = Job_Runtime)) +
    # geom_bar(stat = "identity", position=position_dodge()) +
    ggtitle(paste("Benchmark Results for all Frameworks using SHA512")) +
    guides(color=guide_legend(title="Methods"), shape=guide_legend(title = "Runtime")) +
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

linePlot <- function(sortedData, framework)
  ggplot(sortedData, aes(x = Params, y = Value, group = Target_Method)) +
    geom_line(aes(color=Target_Method)) +
    geom_point(aes(color=Target_Method)) +
    # geom_bar(stat = "identity", position=position_dodge()) +
    ggtitle(paste("Benchmark Results for ", framework, " using SHA512")) +
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

linePlotBCryptByCost <- function(sortedData, framework) {
  plots <- list()
  splitLists <- split(sortedData, list(sortedData$Cost))
  i <- 1
  for (cost in names(splitLists)) {
    currentData <- splitLists[[cost]]
    len <- length(plots)
    plots[[len+1]] <- ggplot(currentData, aes(x = Iterations, y = Value, group = Target_Method)) +
      geom_line(aes(color=Target_Method), show.legend = i == length(names(splitLists))) +
      geom_point(aes(color=Target_Method), show.legend = i == length(names(splitLists))) +
      ggtitle(paste0("With Cost ", cost)) +
      xlab("Iterations") +
      ylab("Time") +
      guides(color=guide_legend(title="Methods ")) +
      theme(plot.margin = unit(c(0.8, 0.2, 0, 0), units = "in")) +
      scale_y_log10(
        minor_breaks = TimeMinorTicks(11),
        breaks = TimeMajorTicks(12),
        labels = addTimeSymbols
      ) +
      scale_x_discrete(
        labels = addNumberSymbols
      )
    i <- i + 1
  }
  labelText <-  paste0("Benchmark Results for ", framework)
  do.call(plot_grid, args = list(plotlist = plots, nrow = 1, labels = labelText, label_size = 20,  label_x = nchar(labelText) * -0.01))
}

linePlotBCryptByIterations <- function(sortedData, framework) {
  plots <- list()
  splitLists <- split(sortedData, list(sortedData$Iterations))
  lastColorLength <- 0
  for (iterations in names(splitLists)) {
    currentData <- splitLists[[iterations]]

    if (length(unique(currentData$Cost)) > 1) {
      lastColorLength <- length(unique(currentData$Cost))
      len <- length(plots)
      plots[[len+1]] <- ggplot(currentData, aes(x = Cost, y = Value, group = Target_Method)) +
        geom_line(aes(color=Target_Method), show.legend = FALSE) +
        geom_point(aes(color=Target_Method), show.legend = FALSE) +
        ggtitle(paste0("With Iterations ", iterations)) +
        xlab("Cost") +
        ylab("Time") +
        guides(color=guide_legend(title="Methods ")) +
        theme(plot.margin = unit(c(0.8, 0.2, 0, 0), units = "in")) +
        scale_y_log10(
          minor_breaks = TimeMinorTicks(11),
          breaks = TimeMajorTicks(12),
          labels = addTimeSymbols
        ) +
        scale_x_discrete(
          labels = addNumberSymbols
        )
    }
  }
  plots[[length(plots)]] <- plots[[length(plots)]] + 
    geom_point(aes(color=rep(unique(sortedData$Target_Method), lastColorLength)), show.legend = TRUE) + 
    geom_line(aes(color=rep(unique(sortedData$Target_Method), lastColorLength)), show.legend = TRUE)
  labelText <-  paste0("Benchmark Results for ", framework)
  do.call(plot_grid, args = list(plotlist = plots, nrow = 1, labels = labelText, label_size = 18,  label_x = nchar(labelText) * -0.01))
}

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

  benchmarkAllFrameworksSHA512Name <- "benchmark_AllFrameworks_SHA512.png"
  ggsave(filename = benchmarkAllFrameworksSHA512Name, plot = allFrameworksPointPlot(formatLinePlotData(resultStats)), width = 8, height = 6)
  printFileSave(benchmarkAllFrameworksSHA512Name)
  
  splitLists <- split(resultStats, list(resultStats$Job_Runtime))

  bCryptPlotByCostGroups <- list()
  bCryptPlotByIterationsGroups <- list()
  for (framework in names(splitLists)) {
    currentData <- splitLists[[framework]]
    frameworkFileName <- str_replace_all(framework, " ", "_")

    benchmarkSHA512Name <- paste0("benchmark_", frameworkFileName, "_SHA512.png")
    ggsave(filename = benchmarkSHA512Name, plot = linePlot(formatLinePlotData(currentData), framework), width = 8, height = 6)
    printFileSave(benchmarkSHA512Name)
    
    bCryptPlotByCost <- linePlotBCryptByCost(formatLinePlot2ParamsData(currentData), framework)
    benchmarkBCryptByCostName <- paste0("benchmark_", frameworkFileName, "_BCryptByCost.png")
    save_plot(benchmarkBCryptByCostName, bCryptPlotByCost, base_height = 8, base_width = 20)
    printFileSave(benchmarkBCryptByCostName)
    len <- length(bCryptPlotByCostGroups)
    bCryptPlotByCostGroups[[len+1]] <- bCryptPlotByCost

    bCryptPlotByIterations <- linePlotBCryptByIterations(formatLinePlot2ParamsData(currentData), framework)
    benchmarkBCryptByIterationsName <- paste0("benchmark_", frameworkFileName, "_BCryptByIterations.png")
    save_plot(benchmarkBCryptByIterationsName, bCryptPlotByIterations, base_height = 6, base_width = 20)
    printFileSave(benchmarkBCryptByIterationsName)
    len <- length(bCryptPlotByIterationsGroups)
    bCryptPlotByIterationsGroups[[len+1]] <- bCryptPlotByIterations
  }
  
  benchmarkAllFrameworksBCryptByCostName <- "benchmark_AllFrameworks_BCryptByCost.png"
  benchmarkAllFrameworksBCryptByIterationsName <- "benchmark_AllFrameworks_BCryptByIterations.png"
  
  save_plot(benchmarkAllFrameworksBCryptByCostName, do.call(plot_grid, args = list(plotlist = bCryptPlotByCostGroups, ncol = 1)), base_height = 20, base_width = 20)
  printFileSave(benchmarkAllFrameworksBCryptByCostName)
  save_plot(benchmarkAllFrameworksBCryptByIterationsName, do.call(plot_grid, args = list(plotlist = bCryptPlotByIterationsGroups, ncol = 1)), base_height = 20, base_width = 25)
  printFileSave(benchmarkAllFrameworksBCryptByIterationsName)
}
