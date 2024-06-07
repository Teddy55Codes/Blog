```

BenchmarkDotNet v0.13.12, Windows 10 (10.0.19045.4291/22H2/2022Update)
Intel Core i7-9750H CPU 2.60GHz, 1 CPU, 12 logical and 6 physical cores
.NET SDK 9.0.100-preview.4.24267.66
  [Host]               : .NET 8.0.4 (8.0.424.16909), X64 RyuJIT AVX2
  .NET 8.0             : .NET 8.0.4 (8.0.424.16909), X64 RyuJIT AVX2
  .NET Framework 4.8.1 : .NET Framework 4.8.1 (4.8.9232.0), X64 RyuJIT VectorSize=256
  NativeAOT 8.0        : .NET 8.0.4, X64 NativeAOT AVX2


```
| Method                              | Job                  | Runtime              | hashType   | Mean        | Error     | StdDev     | Median      |
|------------------------------------ |--------------------- |--------------------- |----------- |------------:|----------:|-----------:|------------:|
| **RegularFor**                          | **.NET 8.0**             | **.NET 8.0**             | **HMACSHA512** |   **370.58 ms** |  **6.882 ms** |  **17.393 ms** |   **371.43 ms** |
| ParallelFor                         | .NET 8.0             | .NET 8.0             | HMACSHA512 |   153.90 ms |  2.993 ms |   4.292 ms |   152.94 ms |
| ParallelOptimizedForSmallOperations | .NET 8.0             | .NET 8.0             | HMACSHA512 |   153.82 ms |  5.165 ms |  15.147 ms |   150.29 ms |
| RegularFor                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | HMACSHA512 | 1,401.76 ms | 28.508 ms |  78.996 ms | 1,374.38 ms |
| ParallelFor                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | HMACSHA512 |   413.89 ms |  7.300 ms |   7.811 ms |   414.82 ms |
| ParallelOptimizedForSmallOperations | .NET Framework 4.8.1 | .NET Framework 4.8.1 | HMACSHA512 |   395.44 ms |  7.845 ms |  11.252 ms |   395.69 ms |
| RegularFor                          | NativeAOT 8.0        | NativeAOT 8.0        | HMACSHA512 |   347.13 ms |  6.848 ms |  10.038 ms |   345.77 ms |
| ParallelFor                         | NativeAOT 8.0        | NativeAOT 8.0        | HMACSHA512 |   155.15 ms |  3.758 ms |  10.599 ms |   152.86 ms |
| ParallelOptimizedForSmallOperations | NativeAOT 8.0        | NativeAOT 8.0        | HMACSHA512 |   162.59 ms |  4.231 ms |  11.794 ms |   160.44 ms |
| **RegularFor**                          | **.NET 8.0**             | **.NET 8.0**             | **SHA512**     |   **210.14 ms** |  **4.142 ms** |   **7.255 ms** |   **209.87 ms** |
| ParallelFor                         | .NET 8.0             | .NET 8.0             | SHA512     |    99.45 ms |  4.027 ms |  11.747 ms |    96.55 ms |
| ParallelOptimizedForSmallOperations | .NET 8.0             | .NET 8.0             | SHA512     |    90.82 ms |  4.121 ms |  12.021 ms |    87.70 ms |
| RegularFor                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA512     |   822.11 ms | 18.159 ms |  50.016 ms |   812.81 ms |
| ParallelFor                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA512     |   291.34 ms |  9.892 ms |  29.012 ms |   286.22 ms |
| ParallelOptimizedForSmallOperations | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA512     |   315.21 ms |  8.703 ms |  25.388 ms |   313.01 ms |
| RegularFor                          | NativeAOT 8.0        | NativeAOT 8.0        | SHA512     |   264.85 ms | 20.303 ms |  59.864 ms |   240.12 ms |
| ParallelFor                         | NativeAOT 8.0        | NativeAOT 8.0        | SHA512     |   115.15 ms |  5.179 ms |  15.272 ms |   118.23 ms |
| ParallelOptimizedForSmallOperations | NativeAOT 8.0        | NativeAOT 8.0        | SHA512     |   113.09 ms |  5.558 ms |  16.387 ms |   107.72 ms |
| **RegularFor**                          | **.NET 8.0**             | **.NET 8.0**             | **SHA256**     |   **310.48 ms** |  **6.137 ms** |   **9.554 ms** |   **308.93 ms** |
| ParallelFor                         | .NET 8.0             | .NET 8.0             | SHA256     |   110.87 ms |  2.202 ms |   3.971 ms |   110.40 ms |
| ParallelOptimizedForSmallOperations | .NET 8.0             | .NET 8.0             | SHA256     |   110.51 ms |  2.167 ms |   3.038 ms |   110.88 ms |
| RegularFor                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA256     | 1,199.39 ms | 23.193 ms |  34.714 ms | 1,203.54 ms |
| ParallelFor                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA256     |   410.99 ms |  7.236 ms |  11.050 ms |   411.28 ms |
| ParallelOptimizedForSmallOperations | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA256     |   385.04 ms |  7.430 ms |   9.397 ms |   386.10 ms |
| RegularFor                          | NativeAOT 8.0        | NativeAOT 8.0        | SHA256     |   325.61 ms |  9.199 ms |  26.688 ms |   318.10 ms |
| ParallelFor                         | NativeAOT 8.0        | NativeAOT 8.0        | SHA256     |   118.15 ms |  2.321 ms |   4.897 ms |   117.98 ms |
| ParallelOptimizedForSmallOperations | NativeAOT 8.0        | NativeAOT 8.0        | SHA256     |   126.23 ms |  3.546 ms |  10.116 ms |   122.26 ms |
| **RegularFor**                          | **.NET 8.0**             | **.NET 8.0**             | **SHA1**       |   **163.43 ms** |  **3.175 ms** |   **4.849 ms** |   **161.97 ms** |
| ParallelFor                         | .NET 8.0             | .NET 8.0             | SHA1       |    74.45 ms |  1.377 ms |   2.586 ms |    74.03 ms |
| ParallelOptimizedForSmallOperations | .NET 8.0             | .NET 8.0             | SHA1       |    75.54 ms |  1.302 ms |   1.017 ms |    75.49 ms |
| RegularFor                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA1       |   437.06 ms |  8.323 ms |   7.785 ms |   436.56 ms |
| ParallelFor                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA1       |   208.98 ms |  5.669 ms |  16.536 ms |   208.18 ms |
| ParallelOptimizedForSmallOperations | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA1       |   217.98 ms |  5.117 ms |  15.007 ms |   217.71 ms |
| RegularFor                          | NativeAOT 8.0        | NativeAOT 8.0        | SHA1       |   178.42 ms |  4.818 ms |  13.511 ms |   173.66 ms |
| ParallelFor                         | NativeAOT 8.0        | NativeAOT 8.0        | SHA1       |   107.97 ms |  4.397 ms |  12.896 ms |   105.34 ms |
| ParallelOptimizedForSmallOperations | NativeAOT 8.0        | NativeAOT 8.0        | SHA1       |    91.16 ms |  3.555 ms |  10.313 ms |    90.53 ms |
| **RegularFor**                          | **.NET 8.0**             | **.NET 8.0**             | **MD5**        |   **181.43 ms** |  **7.021 ms** |  **20.146 ms** |   **174.79 ms** |
| ParallelFor                         | .NET 8.0             | .NET 8.0             | MD5        |    66.93 ms |  2.172 ms |   6.265 ms |    65.78 ms |
| ParallelOptimizedForSmallOperations | .NET 8.0             | .NET 8.0             | MD5        |    70.51 ms |  2.980 ms |   8.355 ms |    69.79 ms |
| RegularFor                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | MD5        |   817.03 ms | 77.785 ms | 225.667 ms |   750.85 ms |
| ParallelFor                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | MD5        |   246.95 ms |  7.183 ms |  21.180 ms |   246.89 ms |
| ParallelOptimizedForSmallOperations | .NET Framework 4.8.1 | .NET Framework 4.8.1 | MD5        |   265.73 ms | 10.034 ms |  29.109 ms |   259.29 ms |
| RegularFor                          | NativeAOT 8.0        | NativeAOT 8.0        | MD5        |   175.20 ms |  4.257 ms |  12.077 ms |   174.53 ms |
| ParallelFor                         | NativeAOT 8.0        | NativeAOT 8.0        | MD5        |    77.30 ms |  2.837 ms |   8.185 ms |    74.82 ms |
| ParallelOptimizedForSmallOperations | NativeAOT 8.0        | NativeAOT 8.0        | MD5        |    83.60 ms |  3.411 ms |  10.003 ms |    81.17 ms |
