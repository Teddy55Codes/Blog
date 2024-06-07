```

BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
Intel Xeon Platinum 8488C, 1 CPU, 64 logical and 32 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI

Job=.NET 8.0  Runtime=.NET 8.0  

```
| Method                                    | cost | Mean         | Error    | StdDev   |
|------------------------------------------ |----- |-------------:|---------:|---------:|
| **BCryptWithLINQ**                            | **4**    |    **323.87 ms** | **0.225 ms** | **0.210 ms** |
| BCryptWithPLINQ                           | 4    |     11.27 ms | 0.046 ms | 0.041 ms |
| BCryptWithOrderedPLINQ                    | 4    |     11.23 ms | 0.046 ms | 0.043 ms |
| BCryptWithRegularFor                      | 4    |    324.27 ms | 0.233 ms | 0.218 ms |
| BCryptWithRegularForEach                  | 4    |    323.52 ms | 0.160 ms | 0.142 ms |
| BCryptWithParallelFor                     | 4    |     13.35 ms | 0.022 ms | 0.020 ms |
| BCryptWithParallelForEach                 | 4    |     13.35 ms | 0.046 ms | 0.041 ms |
| BCryptParallelOptimizedForSmallOperations | 4    |     10.67 ms | 0.047 ms | 0.044 ms |
| **BCryptWithLINQ**                            | **6**    |  **1,235.70 ms** | **0.471 ms** | **0.393 ms** |
| BCryptWithPLINQ                           | 6    |     31.18 ms | 0.093 ms | 0.082 ms |
| BCryptWithOrderedPLINQ                    | 6    |     31.44 ms | 0.217 ms | 0.192 ms |
| BCryptWithRegularFor                      | 6    |  1,237.44 ms | 0.470 ms | 0.393 ms |
| BCryptWithRegularForEach                  | 6    |  1,235.63 ms | 0.331 ms | 0.310 ms |
| BCryptWithParallelFor                     | 6    |     41.41 ms | 0.228 ms | 0.190 ms |
| BCryptWithParallelForEach                 | 6    |     41.43 ms | 0.187 ms | 0.175 ms |
| BCryptParallelOptimizedForSmallOperations | 6    |     31.12 ms | 0.043 ms | 0.038 ms |
| **BCryptWithLINQ**                            | **8**    |  **4,893.76 ms** | **1.593 ms** | **1.330 ms** |
| BCryptWithPLINQ                           | 8    |    111.07 ms | 0.217 ms | 0.181 ms |
| BCryptWithOrderedPLINQ                    | 8    |    110.70 ms | 0.147 ms | 0.115 ms |
| BCryptWithRegularFor                      | 8    |  4,898.85 ms | 0.931 ms | 0.871 ms |
| BCryptWithRegularForEach                  | 8    |  4,894.05 ms | 1.124 ms | 1.051 ms |
| BCryptWithParallelFor                     | 8    |    158.06 ms | 1.809 ms | 1.693 ms |
| BCryptWithParallelForEach                 | 8    |    157.84 ms | 2.243 ms | 2.099 ms |
| BCryptParallelOptimizedForSmallOperations | 8    |    110.02 ms | 0.536 ms | 0.501 ms |
| **BCryptWithLINQ**                            | **10**   | **19,626.18 ms** | **4.566 ms** | **4.271 ms** |
| BCryptWithPLINQ                           | 10   |    426.23 ms | 0.198 ms | 0.165 ms |
| BCryptWithOrderedPLINQ                    | 10   |    425.95 ms | 0.112 ms | 0.099 ms |
| BCryptWithRegularFor                      | 10   | 19,649.42 ms | 2.542 ms | 2.378 ms |
| BCryptWithRegularForEach                  | 10   | 19,631.51 ms | 2.537 ms | 2.373 ms |
| BCryptWithParallelFor                     | 10   |    625.68 ms | 9.992 ms | 9.346 ms |
| BCryptWithParallelForEach                 | 10   |    616.03 ms | 6.086 ms | 5.082 ms |
| BCryptParallelOptimizedForSmallOperations | 10   |    426.76 ms | 1.170 ms | 1.095 ms |
