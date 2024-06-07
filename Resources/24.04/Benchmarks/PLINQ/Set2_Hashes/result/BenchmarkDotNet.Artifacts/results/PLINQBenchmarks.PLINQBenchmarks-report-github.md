```

BenchmarkDotNet v0.13.12, Windows 10 (10.0.19045.4291/22H2/2022Update)
Intel Core i7-9750H CPU 2.60GHz, 1 CPU, 12 logical and 6 physical cores
.NET SDK 9.0.100-preview.4.24267.66
  [Host]               : .NET 8.0.4 (8.0.424.16909), X64 RyuJIT AVX2
  .NET 8.0             : .NET 8.0.4 (8.0.424.16909), X64 RyuJIT AVX2
  .NET Framework 4.8.1 : .NET Framework 4.8.1 (4.8.9232.0), X64 RyuJIT VectorSize=256
  NativeAOT 8.0        : .NET 8.0.4, X64 NativeAOT AVX2


```
| Method           | Job                  | Runtime              | hashType   | Mean        | Error     | StdDev    | Median      |
|----------------- |--------------------- |--------------------- |----------- |------------:|----------:|----------:|------------:|
| **WithLINQ**         | **.NET 8.0**             | **.NET 8.0**             | **HMACSHA512** |   **379.36 ms** |  **7.349 ms** |  **9.555 ms** |   **376.77 ms** |
| WithPLINQ        | .NET 8.0             | .NET 8.0             | HMACSHA512 |   171.56 ms |  4.088 ms | 11.991 ms |   171.05 ms |
| WithOrderedPLINQ | .NET 8.0             | .NET 8.0             | HMACSHA512 |   158.88 ms |  3.160 ms |  8.756 ms |   155.65 ms |
| WithLINQ         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | HMACSHA512 | 1,377.74 ms | 14.300 ms | 12.677 ms | 1,375.34 ms |
| WithPLINQ        | .NET Framework 4.8.1 | .NET Framework 4.8.1 | HMACSHA512 |   470.10 ms |  9.077 ms | 12.117 ms |   469.40 ms |
| WithOrderedPLINQ | .NET Framework 4.8.1 | .NET Framework 4.8.1 | HMACSHA512 |   456.66 ms |  5.234 ms |  4.896 ms |   457.89 ms |
| WithLINQ         | NativeAOT 8.0        | NativeAOT 8.0        | HMACSHA512 |   373.80 ms |  5.846 ms |  4.882 ms |   374.08 ms |
| WithPLINQ        | NativeAOT 8.0        | NativeAOT 8.0        | HMACSHA512 |   161.52 ms |  3.217 ms |  3.443 ms |   161.01 ms |
| WithOrderedPLINQ | NativeAOT 8.0        | NativeAOT 8.0        | HMACSHA512 |   160.02 ms |  2.830 ms |  5.969 ms |   158.19 ms |
| **WithLINQ**         | **.NET 8.0**             | **.NET 8.0**             | **SHA512**     |   **208.62 ms** |  **2.908 ms** |  **2.270 ms** |   **209.37 ms** |
| WithPLINQ        | .NET 8.0             | .NET 8.0             | SHA512     |    99.48 ms |  1.926 ms |  2.061 ms |    99.58 ms |
| WithOrderedPLINQ | .NET 8.0             | .NET 8.0             | SHA512     |    90.41 ms |  1.357 ms |  1.269 ms |    90.25 ms |
| WithLINQ         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA512     |   782.59 ms | 14.621 ms | 12.961 ms |   780.54 ms |
| WithPLINQ        | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA512     |   284.76 ms |  4.910 ms |  9.342 ms |   281.46 ms |
| WithOrderedPLINQ | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA512     |   274.63 ms |  3.581 ms |  3.349 ms |   275.09 ms |
| WithLINQ         | NativeAOT 8.0        | NativeAOT 8.0        | SHA512     |   211.45 ms |  3.905 ms |  3.653 ms |   210.36 ms |
| WithPLINQ        | NativeAOT 8.0        | NativeAOT 8.0        | SHA512     |   100.72 ms |  1.969 ms |  2.189 ms |   101.23 ms |
| WithOrderedPLINQ | NativeAOT 8.0        | NativeAOT 8.0        | SHA512     |    93.34 ms |  1.494 ms |  1.325 ms |    93.00 ms |
| **WithLINQ**         | **.NET 8.0**             | **.NET 8.0**             | **SHA256**     |   **310.31 ms** |  **3.332 ms** |  **2.954 ms** |   **310.21 ms** |
| WithPLINQ        | .NET 8.0             | .NET 8.0             | SHA256     |   119.10 ms |  2.306 ms |  2.265 ms |   118.47 ms |
| WithOrderedPLINQ | .NET 8.0             | .NET 8.0             | SHA256     |   116.09 ms |  1.388 ms |  1.159 ms |   116.42 ms |
| WithLINQ         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA256     | 1,163.30 ms |  8.630 ms |  8.072 ms | 1,164.42 ms |
| WithPLINQ        | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA256     |   414.67 ms |  3.374 ms |  3.156 ms |   415.06 ms |
| WithOrderedPLINQ | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA256     |   409.58 ms |  6.201 ms |  5.497 ms |   408.89 ms |
| WithLINQ         | NativeAOT 8.0        | NativeAOT 8.0        | SHA256     |   305.52 ms |  2.727 ms |  2.418 ms |   305.44 ms |
| WithPLINQ        | NativeAOT 8.0        | NativeAOT 8.0        | SHA256     |   117.43 ms |  2.288 ms |  2.543 ms |   116.91 ms |
| WithOrderedPLINQ | NativeAOT 8.0        | NativeAOT 8.0        | SHA256     |   107.97 ms |  1.373 ms |  1.285 ms |   108.40 ms |
| **WithLINQ**         | **.NET 8.0**             | **.NET 8.0**             | **SHA1**       |   **155.29 ms** |  **2.132 ms** |  **1.781 ms** |   **155.22 ms** |
| WithPLINQ        | .NET 8.0             | .NET 8.0             | SHA1       |    78.22 ms |  1.513 ms |  1.618 ms |    78.28 ms |
| WithOrderedPLINQ | .NET 8.0             | .NET 8.0             | SHA1       |    75.56 ms |  1.038 ms |  0.971 ms |    75.42 ms |
| WithLINQ         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA1       |   443.33 ms |  8.763 ms |  9.740 ms |   441.39 ms |
| WithPLINQ        | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA1       |   256.86 ms |  5.094 ms | 10.173 ms |   257.94 ms |
| WithOrderedPLINQ | .NET Framework 4.8.1 | .NET Framework 4.8.1 | SHA1       |   202.33 ms |  4.030 ms | 10.184 ms |   203.53 ms |
| WithLINQ         | NativeAOT 8.0        | NativeAOT 8.0        | SHA1       |   167.79 ms |  3.352 ms |  4.808 ms |   166.37 ms |
| WithPLINQ        | NativeAOT 8.0        | NativeAOT 8.0        | SHA1       |    83.61 ms |  1.688 ms |  4.924 ms |    83.12 ms |
| WithOrderedPLINQ | NativeAOT 8.0        | NativeAOT 8.0        | SHA1       |    81.11 ms |  1.903 ms |  5.611 ms |    79.28 ms |
| **WithLINQ**         | **.NET 8.0**             | **.NET 8.0**             | **MD5**        |   **161.61 ms** |  **3.144 ms** |  **2.787 ms** |   **162.01 ms** |
| WithPLINQ        | .NET 8.0             | .NET 8.0             | MD5        |    70.93 ms |  1.543 ms |  4.525 ms |    69.37 ms |
| WithOrderedPLINQ | .NET 8.0             | .NET 8.0             | MD5        |    63.72 ms |  1.529 ms |  4.483 ms |    62.16 ms |
| WithLINQ         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | MD5        |   434.63 ms |  8.334 ms |  8.185 ms |   435.33 ms |
| WithPLINQ        | .NET Framework 4.8.1 | .NET Framework 4.8.1 | MD5        |   220.78 ms |  4.407 ms | 11.990 ms |   221.58 ms |
| WithOrderedPLINQ | .NET Framework 4.8.1 | .NET Framework 4.8.1 | MD5        |   246.75 ms |  4.918 ms | 13.126 ms |   247.86 ms |
| WithLINQ         | NativeAOT 8.0        | NativeAOT 8.0        | MD5        |   162.74 ms |  3.108 ms |  2.756 ms |   161.90 ms |
| WithPLINQ        | NativeAOT 8.0        | NativeAOT 8.0        | MD5        |    66.68 ms |  1.069 ms |  1.000 ms |    66.66 ms |
| WithOrderedPLINQ | NativeAOT 8.0        | NativeAOT 8.0        | MD5        |    85.46 ms |  1.294 ms |  1.329 ms |    85.21 ms |
