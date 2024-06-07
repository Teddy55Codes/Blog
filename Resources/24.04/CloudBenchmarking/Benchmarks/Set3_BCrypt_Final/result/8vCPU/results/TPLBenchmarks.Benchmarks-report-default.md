
BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
Intel Xeon Platinum 8488C, 1 CPU, 8 logical and 4 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI

Job=.NET 8.0  Runtime=.NET 8.0  

 Method                                    | cost | Mean         | Error     | StdDev    | Median       |
------------------------------------------ |----- |-------------:|----------:|----------:|-------------:|
 **BCryptWithLINQ**                            | **4**    |    **321.26 ms** |  **0.113 ms** |  **0.106 ms** |    **321.26 ms** |
 BCryptWithPLINQ                           | 4    |     46.02 ms |  0.196 ms |  0.153 ms |     46.05 ms |
 BCryptWithOrderedPLINQ                    | 4    |     46.13 ms |  0.251 ms |  0.210 ms |     46.08 ms |
 BCryptWithRegularFor                      | 4    |    321.87 ms |  0.171 ms |  0.133 ms |    321.88 ms |
 BCryptWithRegularForEach                  | 4    |    321.28 ms |  0.109 ms |  0.097 ms |    321.25 ms |
 BCryptWithParallelFor                     | 4    |     52.16 ms |  1.024 ms |  1.052 ms |     52.45 ms |
 BCryptWithParallelForEach                 | 4    |     52.29 ms |  0.546 ms |  0.511 ms |     52.26 ms |
 BCryptParallelOptimizedForSmallOperations | 4    |     50.00 ms |  0.756 ms |  0.670 ms |     50.00 ms |
 **BCryptWithLINQ**                            | **6**    |  **1,229.52 ms** |  **0.731 ms** |  **0.648 ms** |  **1,229.40 ms** |
 BCryptWithPLINQ                           | 6    |    174.80 ms |  0.587 ms |  0.520 ms |    174.78 ms |
 BCryptWithOrderedPLINQ                    | 6    |    174.50 ms |  1.159 ms |  0.967 ms |    174.05 ms |
 BCryptWithRegularFor                      | 6    |  1,231.15 ms |  0.248 ms |  0.207 ms |  1,231.11 ms |
 BCryptWithRegularForEach                  | 6    |  1,229.50 ms |  0.432 ms |  0.383 ms |  1,229.44 ms |
 BCryptWithParallelFor                     | 6    |    190.43 ms |  3.745 ms |  7.817 ms |    189.19 ms |
 BCryptWithParallelForEach                 | 6    |    199.80 ms |  3.947 ms |  7.217 ms |    200.25 ms |
 BCryptParallelOptimizedForSmallOperations | 6    |    189.04 ms |  3.747 ms |  4.602 ms |    187.68 ms |
 **BCryptWithLINQ**                            | **8**    |  **4,867.85 ms** |  **1.304 ms** |  **1.156 ms** |  **4,867.47 ms** |
 BCryptWithPLINQ                           | 8    |    688.89 ms |  0.912 ms |  0.761 ms |    688.77 ms |
 BCryptWithOrderedPLINQ                    | 8    |    686.83 ms |  1.959 ms |  1.833 ms |    686.38 ms |
 BCryptWithRegularFor                      | 8    |  4,873.97 ms |  1.266 ms |  1.122 ms |  4,873.96 ms |
 BCryptWithRegularForEach                  | 8    |  4,869.27 ms |  0.843 ms |  0.788 ms |  4,869.26 ms |
 BCryptWithParallelFor                     | 8    |    762.78 ms | 15.027 ms | 30.010 ms |    758.28 ms |
 BCryptWithParallelForEach                 | 8    |    738.49 ms | 14.750 ms | 39.626 ms |    723.90 ms |
 BCryptParallelOptimizedForSmallOperations | 8    |    740.95 ms | 14.795 ms | 21.686 ms |    735.77 ms |
 **BCryptWithLINQ**                            | **10**   | **19,495.95 ms** |  **2.037 ms** |  **1.806 ms** | **19,496.68 ms** |
 BCryptWithPLINQ                           | 10   |  2,741.75 ms |  6.133 ms |  5.437 ms |  2,740.99 ms |
 BCryptWithOrderedPLINQ                    | 10   |  2,754.79 ms |  5.083 ms |  4.755 ms |  2,756.23 ms |
 BCryptWithRegularFor                      | 10   | 19,516.91 ms |  0.806 ms |  0.715 ms | 19,516.83 ms |
 BCryptWithRegularForEach                  | 10   | 19,524.66 ms |  8.081 ms |  7.559 ms | 19,526.55 ms |
 BCryptWithParallelFor                     | 10   |  2,859.13 ms | 41.067 ms | 34.293 ms |  2,866.01 ms |
 BCryptWithParallelForEach                 | 10   |  2,913.66 ms | 46.639 ms | 43.626 ms |  2,907.36 ms |
 BCryptParallelOptimizedForSmallOperations | 10   |  2,940.28 ms | 58.350 ms | 79.870 ms |  2,919.18 ms |
