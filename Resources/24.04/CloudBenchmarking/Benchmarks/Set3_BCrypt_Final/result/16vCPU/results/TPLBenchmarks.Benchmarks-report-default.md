
BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
Intel Xeon Platinum 8488C, 1 CPU, 16 logical and 8 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI

Job=.NET 8.0  Runtime=.NET 8.0  

 Method                                    | cost | Mean         | Error     | StdDev    |
------------------------------------------ |----- |-------------:|----------:|----------:|
 **BCryptWithLINQ**                            | **4**    |    **317.61 ms** |  **0.024 ms** |  **0.019 ms** |
 BCryptWithPLINQ                           | 4    |     23.66 ms |  0.182 ms |  0.161 ms |
 BCryptWithOrderedPLINQ                    | 4    |     23.52 ms |  0.114 ms |  0.106 ms |
 BCryptWithRegularFor                      | 4    |    317.95 ms |  0.026 ms |  0.023 ms |
 BCryptWithRegularForEach                  | 4    |    317.55 ms |  0.041 ms |  0.034 ms |
 BCryptWithParallelFor                     | 4    |     28.42 ms |  0.308 ms |  0.288 ms |
 BCryptWithParallelForEach                 | 4    |     28.35 ms |  0.433 ms |  0.405 ms |
 BCryptParallelOptimizedForSmallOperations | 4    |     26.32 ms |  0.184 ms |  0.172 ms |
 **BCryptWithLINQ**                            | **6**    |  **1,222.50 ms** |  **0.099 ms** |  **0.082 ms** |
 BCryptWithPLINQ                           | 6    |     87.47 ms |  0.472 ms |  0.418 ms |
 BCryptWithOrderedPLINQ                    | 6    |     86.89 ms |  0.090 ms |  0.070 ms |
 BCryptWithRegularFor                      | 6    |  1,223.62 ms |  0.061 ms |  0.054 ms |
 BCryptWithRegularForEach                  | 6    |  1,222.05 ms |  0.142 ms |  0.126 ms |
 BCryptWithParallelFor                     | 6    |    104.38 ms |  1.980 ms |  2.356 ms |
 BCryptWithParallelForEach                 | 6    |    103.64 ms |  1.850 ms |  1.545 ms |
 BCryptParallelOptimizedForSmallOperations | 6    |     96.83 ms |  0.861 ms |  0.806 ms |
 **BCryptWithLINQ**                            | **8**    |  **4,841.35 ms** |  **1.212 ms** |  **1.134 ms** |
 BCryptWithPLINQ                           | 8    |    342.16 ms |  0.153 ms |  0.128 ms |
 BCryptWithOrderedPLINQ                    | 8    |    340.69 ms |  0.180 ms |  0.151 ms |
 BCryptWithRegularFor                      | 8    |  4,846.33 ms |  1.157 ms |  1.083 ms |
 BCryptWithRegularForEach                  | 8    |  4,845.60 ms |  0.458 ms |  0.429 ms |
 BCryptWithParallelFor                     | 8    |    386.38 ms |  7.532 ms | 12.789 ms |
 BCryptWithParallelForEach                 | 8    |    394.00 ms |  7.864 ms | 14.962 ms |
 BCryptParallelOptimizedForSmallOperations | 8    |    404.76 ms |  7.966 ms | 12.863 ms |
 **BCryptWithLINQ**                            | **10**   | **19,307.63 ms** |  **1.892 ms** |  **1.678 ms** |
 BCryptWithPLINQ                           | 10   |  1,357.15 ms |  0.633 ms |  0.494 ms |
 BCryptWithOrderedPLINQ                    | 10   |  1,357.67 ms |  0.266 ms |  0.249 ms |
 BCryptWithRegularFor                      | 10   | 19,331.35 ms |  0.963 ms |  0.900 ms |
 BCryptWithRegularForEach                  | 10   | 19,314.79 ms |  2.786 ms |  2.606 ms |
 BCryptWithParallelFor                     | 10   |  1,568.27 ms | 31.166 ms | 87.392 ms |
 BCryptWithParallelForEach                 | 10   |  1,497.68 ms | 29.261 ms | 47.251 ms |
 BCryptParallelOptimizedForSmallOperations | 10   |  1,490.24 ms | 29.801 ms | 62.205 ms |
