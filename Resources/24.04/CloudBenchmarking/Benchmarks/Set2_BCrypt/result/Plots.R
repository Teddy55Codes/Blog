dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE, showWarnings = FALSE)
list.of.packages <- c("ggplot2", "ggthemes", "cowplot", "dplyr", "gdata", "tidyr", "grid", "gridExtra", "Rcpp", "R.devices", "stringr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, lib = Sys.getenv("R_LIBS_USER"), repos = "https://cran.rstudio.com/")
lapply(list.of.packages, library, character.only = TRUE)

std.error <- function(x) sqrt(var(x)/length(x))

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

CreateLinePlot <- function(data, cost, showLegend) 
  ggplot(data, aes(x = CPUConfig, y = Value, color = Target_Method, group = Target_Method)) +
    geom_line(aes(color=Target_Method), show.legend = showLegend) +
    geom_point(aes(color=Target_Method), show.legend = showLegend) +
    ggtitle(paste0("With Cost ", cost)) +
    guides(color=guide_legend(title="Methods")) +
    xlab("vCPU Count") +
    ylab("Time") +
    theme(plot.margin = unit(c(1.5, 0.2, 0, 0.2), units = "in"),
          legend.justification = "center",
          legend.box.margin = margin(-500, 0, 0, -210),
          legend.box.spacing =  unit(c(0, -1, 0, 1), units = "in")) +
    scale_y_log10(
      minor_breaks = TimeMinorTicks(11),
      breaks = TimeMajorTicks(12),
      labels = addTimeSymbols
    )

# Read the CSV file
files <- c("16vCPU/results/ParallelBenchmarks.ParallelLoops-measurements.csv", 
           "32vCPU/results/ParallelBenchmarks.ParallelLoops-measurements.csv", 
           "64vCPU/results/ParallelBenchmarks.ParallelLoops-measurements.csv",
           "96vCPU/results/ParallelBenchmarks.ParallelLoops-measurements.csv")

resultStats_list <- list()

for (file in files) {
  title <- strsplit(file, "/")[[1]][1]
  measurements <- read.csv(file, sep = ",")

  result <- measurements %>% 
    filter(Measurement_IterationStage == "Result")
  
  if (nrow(result[is.na(result$Job_Id),]) > 0)
    result[is.na(result$Job_Id),]$Job_Id <- ""
  
  result$Params <- as.integer(sub(".*cost=([0-9]+)&.*", "\\1", result$Params, perl=TRUE))
  
  resultStats <- result %>% 
    mutate(CPUConfig = title) %>%  # Add the title column
    group_by(Params, CPUConfig, Target_Method) %>%
    summarise(se = std.error(Measurement_Value), Value = mean(Measurement_Value), .groups = 'drop')

  resultStats_list[[length(resultStats_list) + 1]] <- resultStats
}

combined_resultStats <- bind_rows(resultStats_list)


splitLists <- split(combined_resultStats, list(combined_resultStats$Params))

plotsForEachParamConfig <- list()
i <- 1
for (pramsConfig in names(splitLists)) {
  currentData <- splitLists[[pramsConfig]]

  plot <- CreateLinePlot(currentData, pramsConfig, i == length(names(splitLists)))
  len <- length(plotsForEachParamConfig)
  plotsForEachParamConfig[[len+1]] <- plot
  i <- i + 1
}

save_plot(
  "benchmark_BCrypt_CPU_Difference.png", 
  do.call(
    plot_grid, 
    args = list(
      plotlist = plotsForEachParamConfig, 
      nrow = 1, 
      labels = "   Performance for different\nvCPU counts and BCrypt costs", 
      label_size = 20, 
      label_x = -0.29,
      label_y = 0.98)), 
  base_height = 7, 
  base_width = 25)
