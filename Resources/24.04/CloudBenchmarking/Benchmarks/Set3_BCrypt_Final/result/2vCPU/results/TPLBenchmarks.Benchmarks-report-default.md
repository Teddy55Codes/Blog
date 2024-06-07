
BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
Intel Xeon Platinum 8488C, 1 CPU, 2 logical cores and 1 physical core
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI

Job=.NET 8.0  Runtime=.NET 8.0  

 Method                                    | cost | Mean        | Error    | StdDev   | Median      |
------------------------------------------ |----- |------------:|---------:|---------:|------------:|
 **BCryptWithLINQ**                            | **4**    |    **367.3 ms** |  **0.62 ms** |  **0.52 ms** |    **367.4 ms** |
 BCryptWithPLINQ                           | 4    |    207.0 ms |  1.27 ms |  1.12 ms |    207.0 ms |
 BCryptWithOrderedPLINQ                    | 4    |    206.3 ms |  1.22 ms |  1.09 ms |    206.1 ms |
 BCryptWithRegularFor                      | 4    |    367.7 ms |  0.72 ms |  0.64 ms |    367.7 ms |
 BCryptWithRegularForEach                  | 4    |    367.1 ms |  0.79 ms |  0.74 ms |    367.3 ms |
 BCryptWithParallelFor                     | 4    |    207.1 ms |  0.81 ms |  0.72 ms |    207.1 ms |
 BCryptWithParallelForEach                 | 4    |    206.7 ms |  0.87 ms |  0.77 ms |    206.7 ms |
 BCryptParallelOptimizedForSmallOperations | 4    |    206.3 ms |  1.11 ms |  0.98 ms |    206.1 ms |
 **BCryptWithLINQ**                            | **6**    |  **1,407.7 ms** |  **1.52 ms** |  **1.35 ms** |  **1,407.5 ms** |
 BCryptWithPLINQ                           | 6    |    788.6 ms |  4.94 ms |  4.62 ms |    788.1 ms |
 BCryptWithOrderedPLINQ                    | 6    |    784.9 ms |  3.95 ms |  3.50 ms |    784.8 ms |
 BCryptWithRegularFor                      | 6    |  1,408.2 ms |  2.39 ms |  2.24 ms |  1,407.4 ms |
 BCryptWithRegularForEach                  | 6    |  1,405.4 ms |  1.10 ms |  0.86 ms |  1,405.7 ms |
 BCryptWithParallelFor                     | 6    |    794.6 ms |  7.29 ms |  6.82 ms |    795.7 ms |
 BCryptWithParallelForEach                 | 6    |    789.4 ms |  6.63 ms |  6.20 ms |    788.8 ms |
 BCryptParallelOptimizedForSmallOperations | 6    |    812.7 ms | 16.14 ms | 36.43 ms |    789.1 ms |
 **BCryptWithLINQ**                            | **8**    |  **5,562.6 ms** |  **3.22 ms** |  **3.01 ms** |  **5,562.1 ms** |
 BCryptWithPLINQ                           | 8    |  3,103.8 ms |  5.77 ms |  5.40 ms |  3,104.6 ms |
 BCryptWithOrderedPLINQ                    | 8    |  3,089.6 ms |  6.09 ms |  5.40 ms |  3,089.6 ms |
 BCryptWithRegularFor                      | 8    |  5,579.6 ms |  6.19 ms |  5.79 ms |  5,578.0 ms |
 BCryptWithRegularForEach                  | 8    |  5,570.4 ms |  4.02 ms |  3.56 ms |  5,569.3 ms |
 BCryptWithParallelFor                     | 8    |  3,098.7 ms | 10.43 ms |  8.71 ms |  3,095.7 ms |
 BCryptWithParallelForEach                 | 8    |  3,105.0 ms | 21.51 ms | 19.07 ms |  3,095.8 ms |
 BCryptParallelOptimizedForSmallOperations | 8    |  3,117.4 ms | 16.66 ms | 13.01 ms |  3,117.0 ms |
 **BCryptWithLINQ**                            | **10**   | **22,228.1 ms** | **15.03 ms** | **14.05 ms** | **22,229.0 ms** |
 BCryptWithPLINQ                           | 10   | 12,313.8 ms |  8.12 ms |  7.59 ms | 12,314.1 ms |
 BCryptWithOrderedPLINQ                    | 10   | 12,316.8 ms |  9.85 ms |  9.21 ms | 12,314.6 ms |
 BCryptWithRegularFor                      | 10   | 22,231.9 ms |  9.56 ms |  8.94 ms | 22,231.9 ms |
 BCryptWithRegularForEach                  | 10   | 22,205.7 ms | 12.97 ms | 11.50 ms | 22,207.7 ms |
 BCryptWithParallelFor                     | 10   | 12,432.1 ms | 29.22 ms | 22.82 ms | 12,427.6 ms |
 BCryptWithParallelForEach                 | 10   | 12,362.3 ms | 23.54 ms | 19.66 ms | 12,356.8 ms |
 BCryptParallelOptimizedForSmallOperations | 10   | 12,329.7 ms |  7.91 ms |  7.40 ms | 12,331.3 ms |
