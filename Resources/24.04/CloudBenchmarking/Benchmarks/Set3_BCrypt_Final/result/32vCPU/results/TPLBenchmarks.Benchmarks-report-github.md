```

BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
Intel Xeon Platinum 8488C, 1 CPU, 32 logical and 16 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI

Job=.NET 8.0  Runtime=.NET 8.0  

```
| Method                                    | cost | Mean         | Error     | StdDev    | Median       |
|------------------------------------------ |----- |-------------:|----------:|----------:|-------------:|
| **BCryptWithLINQ**                            | **4**    |    **328.84 ms** |  **2.270 ms** |  **2.123 ms** |    **328.97 ms** |
| BCryptWithPLINQ                           | 4    |     15.22 ms |  0.077 ms |  0.072 ms |     15.23 ms |
| BCryptWithOrderedPLINQ                    | 4    |     15.22 ms |  0.091 ms |  0.085 ms |     15.21 ms |
| BCryptWithRegularFor                      | 4    |    329.48 ms |  2.099 ms |  1.964 ms |    329.11 ms |
| BCryptWithRegularForEach                  | 4    |    328.02 ms |  1.854 ms |  1.734 ms |    327.58 ms |
| BCryptWithParallelFor                     | 4    |     19.15 ms |  0.270 ms |  0.253 ms |     19.21 ms |
| BCryptWithParallelForEach                 | 4    |     19.04 ms |  0.379 ms |  0.390 ms |     19.00 ms |
| BCryptParallelOptimizedForSmallOperations | 4    |     16.17 ms |  0.105 ms |  0.098 ms |     16.15 ms |
| **BCryptWithLINQ**                            | **6**    |  **1,254.76 ms** |  **3.832 ms** |  **3.584 ms** |  **1,253.63 ms** |
| BCryptWithPLINQ                           | 6    |     53.43 ms |  0.396 ms |  0.370 ms |     53.49 ms |
| BCryptWithOrderedPLINQ                    | 6    |     53.08 ms |  0.512 ms |  0.454 ms |     53.29 ms |
| BCryptWithRegularFor                      | 6    |  1,258.53 ms |  5.951 ms |  5.567 ms |  1,259.75 ms |
| BCryptWithRegularForEach                  | 6    |  1,257.09 ms |  5.177 ms |  4.842 ms |  1,257.73 ms |
| BCryptWithParallelFor                     | 6    |     59.87 ms |  1.038 ms |  0.867 ms |     59.87 ms |
| BCryptWithParallelForEach                 | 6    |     62.75 ms |  1.253 ms |  2.058 ms |     62.87 ms |
| BCryptParallelOptimizedForSmallOperations | 6    |     57.67 ms |  1.118 ms |  1.243 ms |     57.71 ms |
| **BCryptWithLINQ**                            | **8**    |  **4,994.55 ms** | **13.319 ms** | **12.459 ms** |  **4,996.22 ms** |
| BCryptWithPLINQ                           | 8    |    205.17 ms |  1.479 ms |  1.383 ms |    204.96 ms |
| BCryptWithOrderedPLINQ                    | 8    |    205.04 ms |  1.809 ms |  1.604 ms |    205.39 ms |
| BCryptWithRegularFor                      | 8    |  5,003.08 ms | 10.234 ms |  9.573 ms |  5,003.22 ms |
| BCryptWithRegularForEach                  | 8    |  4,985.43 ms | 15.858 ms | 14.834 ms |  4,989.66 ms |
| BCryptWithParallelFor                     | 8    |    229.62 ms |  4.535 ms |  5.223 ms |    229.13 ms |
| BCryptWithParallelForEach                 | 8    |    230.53 ms |  4.069 ms |  3.607 ms |    229.28 ms |
| BCryptParallelOptimizedForSmallOperations | 8    |    226.03 ms |  4.484 ms |  8.311 ms |    221.03 ms |
| **BCryptWithLINQ**                            | **10**   | **20,030.54 ms** | **22.560 ms** | **21.103 ms** | **20,034.63 ms** |
| BCryptWithPLINQ                           | 10   |    817.93 ms |  6.374 ms |  5.962 ms |    819.33 ms |
| BCryptWithOrderedPLINQ                    | 10   |    821.46 ms |  4.812 ms |  4.018 ms |    823.11 ms |
| BCryptWithRegularFor                      | 10   | 20,066.21 ms | 30.496 ms | 28.526 ms | 20,070.44 ms |
| BCryptWithRegularForEach                  | 10   | 20,034.81 ms | 36.129 ms | 33.795 ms | 20,031.29 ms |
| BCryptWithParallelFor                     | 10   |    915.39 ms | 18.291 ms | 32.512 ms |    927.06 ms |
| BCryptWithParallelForEach                 | 10   |    916.90 ms | 18.074 ms | 34.388 ms |    929.89 ms |
| BCryptParallelOptimizedForSmallOperations | 10   |    947.81 ms |  8.959 ms |  8.381 ms |    948.01 ms |
