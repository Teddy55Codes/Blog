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

TargetMethodToLoopType <- function(Target_Method) {
  if (grepl("ParallelOptimizedForSmallOperations", Target_Method)) {
    return(custom_shapes_by_loop_type[2])
  } else if (grepl("ForEach", Target_Method)) {
    return(custom_shapes_by_loop_type[2])
  } else if (grepl("For", Target_Method)) {
    return(custom_shapes_by_loop_type[1])
  } else if (grepl("LINQ", Target_Method)) {
    return(custom_shapes_by_loop_type[3])
  }
}

AddLoopTypeColumn <- function(table) 
  table %>% rowwise() %>% mutate(Loop_Type = TargetMethodToLoopType(Target_Method))


CreateLinePlot <- function(data, cost, showLegend)
  ggplot(data, aes(x = CPUConfig, y = Value, color = Target_Method, group = Target_Method)) +
    geom_line(aes(color=Target_Method), show.legend = showLegend) +
    geom_point(aes(color=Target_Method, shape=Loop_Type), show.legend = showLegend) +
    ggtitle(paste0("With Cost ", cost)) +
    guides(color=guide_legend(title="Methods"), shape=guide_legend(title="General Loop Types")) +
    xlab("vCPU Count") +
    ylab("Time") +
    theme(plot.margin = unit(c(2.4, 0.2, 0, 0.2), units = "in"),
          legend.justification = "center",
          legend.box.margin = margin(-600, 0, 0, -330),
          legend.box.spacing =  unit(c(0, -1, 0, 1), units = "in"),
          legend.box = "horizontal") +
    scale_y_log10(
      minor_breaks = TimeMinorTicks(11),
      breaks = TimeMajorTicks(12),
      labels = addTimeSymbols
    )

CreateLinePlotNumericvCPUCount <- function(data, cost, showLegend) 
  ggplot(data, aes(x = CPUConfig, y = Value, color = Target_Method, group = Target_Method)) +
    geom_line(aes(color=Target_Method), show.legend = showLegend) +
    geom_point(aes(color=Target_Method, shape=Loop_Type), show.legend = showLegend) +
    ggtitle(paste0("With Cost ", cost)) +
    guides(color=guide_legend(title="Methods"), shape=guide_legend(title="General Loop Types")) +
    xlab("vCPU Count") +
    ylab("Time") +
    theme(plot.margin = unit(c(2.4, 0.2, 0, 0.2), units = "in"),
          legend.justification = "center",
          legend.box.margin = margin(-600, 0, 0, -330),
          legend.box.spacing =  unit(c(0, -1, 0, 1), units = "in"),
          legend.box = "horizontal") +
    scale_y_log10(
      minor_breaks = TimeMinorTicks(11),
      breaks = TimeMajorTicks(12),
      labels = addTimeSymbols
    )


CreateLinePlotNumericvCPUCountXlog2 <- function(data, cost, showLegend)
  ggplot(data, aes(x = CPUConfig, y = Value, color = Target_Method, group = Target_Method)) +
    geom_line(aes(color=Target_Method), show.legend = showLegend) +
    geom_point(aes(color=Target_Method, shape=Loop_Type), show.legend = showLegend) +
    ggtitle(paste0("With Cost ", cost)) +
    guides(color=guide_legend(title="Methods"), shape=guide_legend(title="General Loop Types")) +
    xlab("vCPU Count") +
    ylab("Time") +
    theme(plot.margin = unit(c(2.4, 0.2, 0, 0.2), units = "in"),
          legend.justification = "center",
          legend.box.margin = margin(-600, 0, 0, -330),
          legend.box.spacing =  unit(c(0, -1, 0, 1), units = "in"),
          legend.box = "horizontal") +
    scale_y_log10(
      minor_breaks = TimeMinorTicks(11),
      breaks = TimeMajorTicks(12),
      labels = addTimeSymbols
    ) +
    scale_x_log10(
      breaks = unique(unlist(data$CPUConfig, use.names = FALSE)),
    )

diagram_title <- "   Performance for different loops with\n different vCPU counts and BCrypt costs"
diagram_title_size <- 20
diagram_title_offset_x <- -0.37
diagram_title_offset_y <- 0.95

## WHEN RENAMING BENCHMARK METHODS THE NAME NEEDS TO BE CHANGED HERE AS WELL.
# This list sets the shapes based on the type of loop.
custom_shapes_by_loop_type <- c("(Parallel)For", "(Parallel)ForEach", "(P)LINQ")

# Read the CSV file
files <- c("2vCPU/results/TPLBenchmarks.Benchmarks-measurements.csv",
           "4vCPU/results/TPLBenchmarks.Benchmarks-measurements.csv",
           "8vCPU/results/TPLBenchmarks.Benchmarks-measurements.csv",
           "16vCPU/results/TPLBenchmarks.Benchmarks-measurements.csv", 
           "32vCPU/results/TPLBenchmarks.Benchmarks-measurements.csv", 
           "64vCPU/results/TPLBenchmarks.Benchmarks-measurements.csv",
           "96vCPU/results/TPLBenchmarks.Benchmarks-measurements.csv",
           "192vCPU/results/TPLBenchmarks.Benchmarks-measurements.csv")

vCPUCategories <- str_split_i(files, "/", 1)

resultStats_list <- list()

for (file in files) {
  title <- str_split_i(file, "/", 1)
  measurements <- read.csv(file, sep = ",")

  result <- measurements %>% 
    filter(Measurement_IterationStage == "Result")
  
  if (nrow(result[is.na(result$Job_Id),]) > 0)
    result[is.na(result$Job_Id),]$Job_Id <- ""
  
  result$Params <- as.integer(sub("cost=([0-9]+)", "\\1", result$Params, perl=TRUE))
  
  resultStats <- result %>% 
    mutate(CPUConfig = title) %>%  # Adding extra column for CPU configuration the title column
    group_by(Params, CPUConfig, Target_Method) %>%
    summarise(se = std.error(Measurement_Value), Value = mean(Measurement_Value), .groups = 'drop')

  resultStats_list[[length(resultStats_list) + 1]] <- resultStats
}

combined_resultStats <- bind_rows(resultStats_list) %>% AddLoopTypeColumn()


# vCPU count as categories
combined_resultStats <- AddLoopTypeColumn(combined_resultStats)
combined_resultStats$CPUConfig <- factor(combined_resultStats$CPUConfig, levels = vCPUCategories)

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
  "benchmark_BCrypt_vCPU_Difference.png",
  do.call(
    plot_grid,
    args = list(
      plotlist = plotsForEachParamConfig,
      nrow = 1,
      labels = diagram_title,
      label_size = diagram_title_size,
      label_x = diagram_title_offset_x,
      label_y = diagram_title_offset_y)),
  base_height = 8.5,
  base_width = 25)

# numeric vCPU count
combined_resultStats$CPUConfig <- as.integer(sub("([0-9]+)vCPU", "\\1", combined_resultStats$CPUConfig, perl=TRUE))

splitLists <- split(combined_resultStats, list(combined_resultStats$Params))

plotsForEachParamConfig <- list()
plotsForEachParamConfig1 <- list()
i <- 1
for (pramsConfig in names(splitLists)) {
  currentData <- splitLists[[pramsConfig]]

  plot <- CreateLinePlotNumericvCPUCount(currentData, pramsConfig, i == length(names(splitLists)))
  len <- length(plotsForEachParamConfig)
  plotsForEachParamConfig[[len+1]] <- plot

  plot <- CreateLinePlotNumericvCPUCountXlog2(currentData, pramsConfig, i == length(names(splitLists)))
  len <- length(plotsForEachParamConfig1)
  plotsForEachParamConfig1[[len+1]] <- plot
  i <- i + 1
}

save_plot(
  "benchmark_BCrypt_vCPU_Difference_Numeric_vCPU_Count.png", 
  do.call(
    plot_grid, 
    args = list(
      plotlist = plotsForEachParamConfig, 
      nrow = 1, 
      labels = diagram_title,
      label_size = diagram_title_size,
      label_x = diagram_title_offset_x,
      label_y = diagram_title_offset_y)),
  base_height = 8.5, 
  base_width = 25)

save_plot(
  "benchmark_BCrypt_vCPU_Difference_Numeric_vCPU_Count_With_X_Log2.png",
  do.call(
    plot_grid,
    args = list(
      plotlist = plotsForEachParamConfig1,
      nrow = 1,
      labels = diagram_title,
      label_size = diagram_title_size,
      label_x = diagram_title_offset_x,
      label_y = diagram_title_offset_y)),
  base_height = 8.5,
  base_width = 25)
