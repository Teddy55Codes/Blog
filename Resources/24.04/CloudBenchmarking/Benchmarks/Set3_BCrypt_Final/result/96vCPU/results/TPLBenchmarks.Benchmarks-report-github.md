```

BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
Intel Xeon Platinum 8488C, 1 CPU, 96 logical and 48 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI

Job=.NET 8.0  Runtime=.NET 8.0  

```
| Method                                    | cost | Mean          | Error     | StdDev    | Median        |
|------------------------------------------ |----- |--------------:|----------:|----------:|--------------:|
| **BCryptWithLINQ**                            | **4**    |    **324.046 ms** | **0.2251 ms** | **0.2106 ms** |    **324.079 ms** |
| BCryptWithPLINQ                           | 4    |     11.108 ms | 0.1434 ms | 0.1341 ms |     11.143 ms |
| BCryptWithOrderedPLINQ                    | 4    |     11.078 ms | 0.1120 ms | 0.1047 ms |     11.108 ms |
| BCryptWithRegularFor                      | 4    |    324.162 ms | 0.2012 ms | 0.1784 ms |    324.216 ms |
| BCryptWithRegularForEach                  | 4    |    323.851 ms | 0.2532 ms | 0.2115 ms |    323.888 ms |
| BCryptWithParallelFor                     | 4    |     11.113 ms | 0.0321 ms | 0.0300 ms |     11.115 ms |
| BCryptWithParallelForEach                 | 4    |     11.145 ms | 0.0758 ms | 0.0709 ms |     11.164 ms |
| BCryptParallelOptimizedForSmallOperations | 4    |      9.555 ms | 0.0385 ms | 0.0360 ms |      9.555 ms |
| **BCryptWithLINQ**                            | **6**    |  **1,235.666 ms** | **0.3376 ms** | **0.3158 ms** |  **1,235.620 ms** |
| BCryptWithPLINQ                           | 6    |     23.921 ms | 0.2416 ms | 0.2018 ms |     23.900 ms |
| BCryptWithOrderedPLINQ                    | 6    |     23.921 ms | 0.2038 ms | 0.1807 ms |     23.858 ms |
| BCryptWithRegularFor                      | 6    |  1,238.058 ms | 0.4275 ms | 0.3790 ms |  1,238.075 ms |
| BCryptWithRegularForEach                  | 6    |  1,236.017 ms | 0.5455 ms | 0.4555 ms |  1,236.121 ms |
| BCryptWithParallelFor                     | 6    |     29.203 ms | 0.2484 ms | 0.2324 ms |     29.245 ms |
| BCryptWithParallelForEach                 | 6    |     29.077 ms | 0.1828 ms | 0.1526 ms |     29.058 ms |
| BCryptParallelOptimizedForSmallOperations | 6    |     23.466 ms | 0.0700 ms | 0.0654 ms |     23.462 ms |
| **BCryptWithLINQ**                            | **8**    |  **4,897.840 ms** | **2.2611 ms** | **2.1151 ms** |  **4,897.478 ms** |
| BCryptWithPLINQ                           | 8    |     82.054 ms | 0.1912 ms | 0.1695 ms |     82.019 ms |
| BCryptWithOrderedPLINQ                    | 8    |     82.320 ms | 0.0295 ms | 0.0262 ms |     82.324 ms |
| BCryptWithRegularFor                      | 8    |  4,901.316 ms | 0.9185 ms | 0.8142 ms |  4,901.534 ms |
| BCryptWithRegularForEach                  | 8    |  4,897.910 ms | 1.7518 ms | 1.6386 ms |  4,897.579 ms |
| BCryptWithParallelFor                     | 8    |     91.650 ms | 1.8213 ms | 4.3637 ms |     89.937 ms |
| BCryptWithParallelForEach                 | 8    |     91.914 ms | 1.6601 ms | 3.6787 ms |     90.968 ms |
| BCryptParallelOptimizedForSmallOperations | 8    |     82.003 ms | 0.3012 ms | 0.2817 ms |     82.004 ms |
| **BCryptWithLINQ**                            | **10**   | **19,638.990 ms** | **4.5440 ms** | **4.0282 ms** | **19,638.217 ms** |
| BCryptWithPLINQ                           | 10   |    322.556 ms | 0.1233 ms | 0.1154 ms |    322.510 ms |
| BCryptWithOrderedPLINQ                    | 10   |    322.493 ms | 0.1085 ms | 0.0962 ms |    322.480 ms |
| BCryptWithRegularFor                      | 10   | 19,667.394 ms | 4.1916 ms | 3.9209 ms | 19,666.607 ms |
| BCryptWithRegularForEach                  | 10   | 19,651.915 ms | 6.4978 ms | 6.0780 ms | 19,652.644 ms |
| BCryptWithParallelFor                     | 10   |    451.931 ms | 0.2789 ms | 0.2609 ms |    452.023 ms |
| BCryptWithParallelForEach                 | 10   |    451.931 ms | 0.2358 ms | 0.2206 ms |    451.890 ms |
| BCryptParallelOptimizedForSmallOperations | 10   |    324.004 ms | 2.5221 ms | 2.3592 ms |    322.761 ms |
