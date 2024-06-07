dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE, showWarnings = FALSE)
list.of.packages <- c("ggplot2", "ggthemes", "dplyr", "gdata", "tidyr", "grid", "gridExtra", "Rcpp", "R.devices", "stringr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, lib = Sys.getenv("R_LIBS_USER"), repos = "https://cran.rstudio.com/")
lapply(list.of.packages, library, character.only = TRUE)

## WHEN ADDING AN HASHALGORITH TO THE BENCHMARK IT NEEDS TO ALSO NEEDS TO BE ADDED TO THIS. 
# This list sets the order based on how expensive a hash is
custom_hash_order <- c("MD5", "SHA1", "SHA256", "SHA512", "HMACSHA512")

std.error <- function(x) sqrt(var(x)/length(x))

addTimeSymbols <- function(x)
  ifelse(x >= 1000000000, paste0(x / 1000000000, " sec"),
         ifelse(x >= 1000000, paste0(x / 1000000, " ms"),
                ifelse(x >= 1000, paste0(x / 1000, " us"),
                       paste0(x, " ns"))))

TimeMajorTicks <- function(factor, minfactor = 1, curr = numeric()) {
  factorNum <- as.integer(factor)
  if (is.na(factorNum) || factorNum < minfactor)
    return(curr)
  else
    return(TimeMajorTicks(factorNum - 1, minfactor = minfactor, c(10^(factorNum - 1), curr)))
}
  
TimeMinorTicks <- function(factor, minfactor = 1, curr = numeric()) {
  factorNum <- as.integer(factor)
  if (is.na(factorNum) || factorNum < minfactor)
    return(curr)
  else
    return(TimeMinorTicks(factorNum - 1, minfactor = minfactor, c(seq(10^(factorNum - 1) * 2, 10^(factorNum - 1) * 9, by = 10^(factorNum - 1)), curr)))
}

printFileSave <- function(filename) cat(paste0("Generated Plot: ", filename, "\n"))

sortBenchmarkTable <- function(data) {
  data[order(data$Target_Method, data$Value), ]
}

formatPlotData <- function(data) {
  sortedData <- sortBenchmarkTable(data)
  
  sortedData$Params <- sub(".*hashType=([A-Za-z0-9]+).*", "\\1", sortedData$Params, perl=TRUE)
  sortedData$Params <- factor(sortedData$Params, levels = custom_hash_order)
  return(sortedData)
}

barplot <- function(sortedData, framework)
  ggplot(sortedData, aes(x = Target_Method, y = Value, group = Params)) +
    geom_bar(stat = "identity", position=position_dodge(), aes(fill=Params)) +
    ggtitle(paste("Benchmark Results for ", framework)) +
    guides(fill=guide_legend(title="Hash Algorithms")) +
    xlab("Methods") +
    ylab("Time") +
    coord_cartesian(
      ylim = c(1 * 10^7, 1 * 10^9),
      expand = TRUE
    ) +
    scale_y_log10(
      minor_breaks = TimeMinorTicks(10),
      breaks = TimeMajorTicks(11),
      labels = addTimeSymbols
    )

lineplot <- function(sortedData, framework)
  ggplot(sortedData, aes(x = Params, y = Value, color = Target_Method, group = Target_Method)) +
    geom_line(aes(color=Target_Method)) +
    geom_point(aes(color=Target_Method)) +
    ggtitle(paste("Benchmark Results for ", framework)) +
    guides(color=guide_legend(title="Methods")) +
    xlab("Hash Algorithms") +
    ylab("Time") +
    scale_y_log10(
      minor_breaks = TimeMinorTicks(10),
      breaks = TimeMajorTicks(11),
      labels = addTimeSymbols
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

  for (framework in names(splitLists)) {
    currentData <- splitLists[[framework]]
    
    frameworkFileName <- str_replace_all(framework, " ", "_")

    benchmarkGroupedByMethod <- paste0("benchmark_", frameworkFileName, "_grouped_by_method.png")
    benchmarkGroupedByHashAlgorithm <- paste0("benchmark_", frameworkFileName, "_grouped_by_hash_algorithm.png")
    ggsave(filename = benchmarkGroupedByMethod, plot = barplot(formatPlotData(currentData), framework), width = 12, height = 5)
    ggsave(filename = benchmarkGroupedByHashAlgorithm, plot = lineplot(formatPlotData(currentData), framework), width = 12, height = 5)
    printFileSave(benchmarkGroupedByMethod)
    printFileSave(benchmarkGroupedByHashAlgorithm)
  }
}
