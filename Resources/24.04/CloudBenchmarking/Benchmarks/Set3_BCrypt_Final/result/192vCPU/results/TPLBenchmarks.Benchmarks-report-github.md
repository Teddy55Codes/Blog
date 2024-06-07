```

BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
Intel Xeon Platinum 8488C, 2 CPU, 192 logical and 96 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI

Job=.NET 8.0  Runtime=.NET 8.0  

```
| Method                                    | cost | Mean          | Error     | StdDev    |
|------------------------------------------ |----- |--------------:|----------:|----------:|
| **BCryptWithLINQ**                            | **4**    |    **323.918 ms** | **0.2630 ms** | **0.2460 ms** |
| BCryptWithPLINQ                           | 4    |     10.162 ms | 0.1097 ms | 0.0973 ms |
| BCryptWithOrderedPLINQ                    | 4    |     10.127 ms | 0.0537 ms | 0.0502 ms |
| BCryptWithRegularFor                      | 4    |    323.733 ms | 0.2543 ms | 0.2254 ms |
| BCryptWithRegularForEach                  | 4    |    323.485 ms | 0.4668 ms | 0.4138 ms |
| BCryptWithParallelFor                     | 4    |     10.354 ms | 0.0726 ms | 0.0679 ms |
| BCryptWithParallelForEach                 | 4    |      9.969 ms | 0.1384 ms | 0.1156 ms |
| BCryptParallelOptimizedForSmallOperations | 4    |     10.131 ms | 0.1002 ms | 0.0937 ms |
| **BCryptWithLINQ**                            | **6**    |  **1,236.731 ms** | **0.5053 ms** | **0.4479 ms** |
| BCryptWithPLINQ                           | 6    |     20.559 ms | 0.0991 ms | 0.0828 ms |
| BCryptWithOrderedPLINQ                    | 6    |     20.515 ms | 0.1036 ms | 0.0969 ms |
| BCryptWithRegularFor                      | 6    |  1,238.089 ms | 0.5234 ms | 0.4896 ms |
| BCryptWithRegularForEach                  | 6    |  1,237.043 ms | 0.5151 ms | 0.4819 ms |
| BCryptWithParallelFor                     | 6    |     19.900 ms | 0.0414 ms | 0.0367 ms |
| BCryptWithParallelForEach                 | 6    |     19.959 ms | 0.0616 ms | 0.0546 ms |
| BCryptParallelOptimizedForSmallOperations | 6    |     19.936 ms | 0.0895 ms | 0.0837 ms |
| **BCryptWithLINQ**                            | **8**    |  **4,897.719 ms** | **2.2091 ms** | **1.9583 ms** |
| BCryptWithPLINQ                           | 8    |     53.053 ms | 0.4948 ms | 0.4386 ms |
| BCryptWithOrderedPLINQ                    | 8    |     52.994 ms | 0.7676 ms | 0.7180 ms |
| BCryptWithRegularFor                      | 8    |  4,905.401 ms | 2.0992 ms | 1.8609 ms |
| BCryptWithRegularForEach                  | 8    |  4,899.151 ms | 1.8620 ms | 1.7418 ms |
| BCryptWithParallelFor                     | 8    |     51.872 ms | 0.7024 ms | 0.6570 ms |
| BCryptWithParallelForEach                 | 8    |     51.413 ms | 0.2523 ms | 0.2236 ms |
| BCryptParallelOptimizedForSmallOperations | 8    |     51.547 ms | 0.3429 ms | 0.2864 ms |
| **BCryptWithLINQ**                            | **10**   | **19,661.969 ms** | **4.7018 ms** | **4.3981 ms** |
| BCryptWithPLINQ                           | 10   |    176.055 ms | 3.1808 ms | 2.8197 ms |
| BCryptWithOrderedPLINQ                    | 10   |    176.985 ms | 0.0833 ms | 0.0696 ms |
| BCryptWithRegularFor                      | 10   | 19,680.638 ms | 7.4164 ms | 6.9373 ms |
| BCryptWithRegularForEach                  | 10   | 19,658.612 ms | 2.8677 ms | 2.6824 ms |
| BCryptWithParallelFor                     | 10   |    178.483 ms | 2.0099 ms | 1.8800 ms |
| BCryptWithParallelForEach                 | 10   |    176.501 ms | 0.7714 ms | 0.6838 ms |
| BCryptParallelOptimizedForSmallOperations | 10   |    175.230 ms | 2.3266 ms | 2.1763 ms |
