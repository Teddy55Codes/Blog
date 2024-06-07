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

# Read the CSV file
files <- c("16vCPU/results/ParallelBenchmarks.ParallelLoops-measurements.csv", 
           "32vCPU/results/ParallelBenchmarks.ParallelLoops-measurements.csv", 
           "64vCPU/results/ParallelBenchmarks.ParallelLoops-measurements.csv")

resultStats_list <- list()

for (file in files) {
  title <- strsplit(file, "/")[[1]][1]
  measurements <- read.csv(file, sep = ",")

  result <- measurements %>% 
    filter(Measurement_IterationStage == "Result") %>% 
    filter(Params == "iterations=100000&hashType=HMACSHA512")
  
  if (nrow(result[is.na(result$Job_Id),]) > 0)
    result[is.na(result$Job_Id),]$Job_Id <- ""

  resultStats <- result %>%
    mutate(CPUConfig = title) %>%  # Add the title column
    group_by(CPUConfig, Target_Method) %>%
    summarise(se = std.error(Measurement_Value), Value = mean(Measurement_Value), .groups = 'drop')

  resultStats_list[[length(resultStats_list) + 1]] <- resultStats
}

combined_resultStats <- bind_rows(resultStats_list)

p <- ggplot(combined_resultStats, aes(x = CPUConfig, y = Value, color = Target_Method, group = Target_Method)) +
  geom_line() +
  geom_point() +
  ggtitle("Performance for different vCPU counts for HMACSHA512 hash") +
  guides(color=guide_legend(title="Methods")) +
  xlab("vCPU Count") +
  ylab("Time") +
  scale_y_continuous(
    breaks = c(10^8, 2 * 10^8, 3 * 10^8, 4 * 10^8, 5 * 10^8, 6 * 10^8, 7 * 10^8),
    labels = addTimeSymbols
  )

ggsave(filename = "benchmark_Hashing_CPU_Difference.png", plot=p, width = 10, height = 10)
