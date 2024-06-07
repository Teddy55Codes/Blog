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
files <- append(list.files(path = "ParallelLoops/Set2_Hashes/result/BenchmarkDotNet.Artifacts/results", pattern = "-measurements\\.csv$", full.names = TRUE),
                list.files(path = "PLINQ/Set2_Hashes/result/BenchmarkDotNet.Artifacts/results", pattern = "-measurements\\.csv$", full.names = TRUE))
allMeasurementfiles <- list()
for (file in files) {
  measurements <- read.csv(file, sep = ";")
  len <- length(allMeasurementfiles)
  allMeasurementfiles[[len+1]] <- measurements
}
allMeasurements <- merge(allMeasurementfiles[[1]], allMeasurementfiles[[2]], all.x = TRUE, all.y = TRUE)


result <- allMeasurements %>% filter(Measurement_IterationStage == "Result")
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

  benchmarkGroupedByHashAlgorithm <- paste0("benchmark_", frameworkFileName, "_grouped_by_hash_algorithm.png")
  ggsave(filename = benchmarkGroupedByHashAlgorithm, plot = lineplot(formatPlotData(currentData), framework), width = 12, height = 5)
  printFileSave(benchmarkGroupedByHashAlgorithm)
}

