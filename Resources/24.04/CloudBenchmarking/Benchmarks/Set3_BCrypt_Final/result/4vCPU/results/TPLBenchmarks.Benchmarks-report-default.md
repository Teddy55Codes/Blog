
BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
Intel Xeon Platinum 8488C, 1 CPU, 4 logical and 2 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI

Job=.NET 8.0  Runtime=.NET 8.0  

 Method                                    | cost | Mean         | Error      | StdDev     |
------------------------------------------ |----- |-------------:|-----------:|-----------:|
 **BCryptWithLINQ**                            | **4**    |    **321.41 ms** |   **0.206 ms** |   **0.183 ms** |
 BCryptWithPLINQ                           | 4    |     90.85 ms |   0.346 ms |   0.270 ms |
 BCryptWithOrderedPLINQ                    | 4    |     90.57 ms |   0.712 ms |   0.631 ms |
 BCryptWithRegularFor                      | 4    |    321.77 ms |   0.200 ms |   0.178 ms |
 BCryptWithRegularForEach                  | 4    |    321.34 ms |   0.182 ms |   0.152 ms |
 BCryptWithParallelFor                     | 4    |     93.22 ms |   0.648 ms |   0.606 ms |
 BCryptWithParallelForEach                 | 4    |     92.71 ms |   0.518 ms |   0.459 ms |
 BCryptParallelOptimizedForSmallOperations | 4    |     93.74 ms |   1.540 ms |   1.365 ms |
 **BCryptWithLINQ**                            | **6**    |  **1,231.45 ms** |   **1.767 ms** |   **1.653 ms** |
 BCryptWithPLINQ                           | 6    |    346.91 ms |   3.283 ms |   3.071 ms |
 BCryptWithOrderedPLINQ                    | 6    |    347.08 ms |   3.632 ms |   3.397 ms |
 BCryptWithRegularFor                      | 6    |  1,231.01 ms |   0.708 ms |   0.628 ms |
 BCryptWithRegularForEach                  | 6    |  1,231.24 ms |   0.631 ms |   0.527 ms |
 BCryptWithParallelFor                     | 6    |    356.17 ms |   6.329 ms |   5.920 ms |
 BCryptWithParallelForEach                 | 6    |    355.89 ms |   6.641 ms |   7.106 ms |
 BCryptParallelOptimizedForSmallOperations | 6    |    363.72 ms |   7.231 ms |  10.823 ms |
 **BCryptWithLINQ**                            | **8**    |  **4,878.58 ms** |   **4.421 ms** |   **3.919 ms** |
 BCryptWithPLINQ                           | 8    |  1,360.22 ms |   3.194 ms |   2.831 ms |
 BCryptWithOrderedPLINQ                    | 8    |  1,360.42 ms |   2.692 ms |   2.248 ms |
 BCryptWithRegularFor                      | 8    |  4,875.77 ms |   2.632 ms |   2.333 ms |
 BCryptWithRegularForEach                  | 8    |  4,869.05 ms |   1.331 ms |   1.111 ms |
 BCryptWithParallelFor                     | 8    |  1,403.99 ms |  27.761 ms |  28.508 ms |
 BCryptWithParallelForEach                 | 8    |  1,405.74 ms |  25.604 ms |  23.950 ms |
 BCryptParallelOptimizedForSmallOperations | 8    |  1,462.25 ms |  29.240 ms |  62.314 ms |
 **BCryptWithLINQ**                            | **10**   | **19,498.59 ms** |   **2.283 ms** |   **2.136 ms** |
 BCryptWithPLINQ                           | 10   |  5,447.43 ms |   8.162 ms |   7.236 ms |
 BCryptWithOrderedPLINQ                    | 10   |  5,415.21 ms |   8.108 ms |   7.188 ms |
 BCryptWithRegularFor                      | 10   | 19,522.30 ms |   3.287 ms |   2.914 ms |
 BCryptWithRegularForEach                  | 10   | 19,507.20 ms |  12.361 ms |  11.563 ms |
 BCryptWithParallelFor                     | 10   |  5,537.27 ms | 100.799 ms | 150.871 ms |
 BCryptWithParallelForEach                 | 10   |  5,526.18 ms | 107.463 ms | 123.755 ms |
 BCryptParallelOptimizedForSmallOperations | 10   |  5,740.89 ms | 111.778 ms | 119.601 ms |
