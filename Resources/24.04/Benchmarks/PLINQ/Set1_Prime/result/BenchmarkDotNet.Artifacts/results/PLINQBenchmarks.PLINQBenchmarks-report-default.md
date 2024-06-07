
BenchmarkDotNet v0.13.12, Windows 10 (10.0.19045.4291/22H2/2022Update)
Intel Core i7-9750H CPU 2.60GHz, 1 CPU, 12 logical and 6 physical cores
.NET SDK 9.0.100-preview.3.24204.13
  [Host]               : .NET 8.0.4 (8.0.424.16909), X64 RyuJIT AVX2
  .NET 8.0             : .NET 8.0.4 (8.0.424.16909), X64 RyuJIT AVX2
  .NET Framework 4.8.1 : .NET Framework 4.8.1 (4.8.9232.0), X64 RyuJIT VectorSize=256
  NativeAOT 8.0        : .NET 8.0.2, X64 NativeAOT AVX2


 Method           | Job                  | Runtime              | iterations | Mean          | Error        | StdDev        | Median        |
----------------- |--------------------- |--------------------- |----------- |--------------:|-------------:|--------------:|--------------:|
 **WithLINQ**         | **.NET 8.0**             | **.NET 8.0**             | **1000**       |      **15.56 μs** |     **0.306 μs** |      **0.520 μs** |      **15.60 μs** |
 WithPLINQ        | .NET 8.0             | .NET 8.0             | 1000       |      21.24 μs |     0.501 μs |      1.406 μs |      21.20 μs |
 WithOrderedPLINQ | .NET 8.0             | .NET 8.0             | 1000       |      66.99 μs |     4.743 μs |     13.909 μs |      61.32 μs |
 WithLINQ         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 1000       |      29.21 μs |     0.880 μs |      2.333 μs |      28.47 μs |
 WithPLINQ        | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 1000       |     305.61 μs |     7.051 μs |     20.678 μs |     304.14 μs |
 WithOrderedPLINQ | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 1000       |     435.42 μs |     8.663 μs |     24.435 μs |     432.30 μs |
 WithLINQ         | NativeAOT 8.0        | NativeAOT 8.0        | 1000       |      29.09 μs |     2.515 μs |      7.416 μs |      25.73 μs |
 WithPLINQ        | NativeAOT 8.0        | NativeAOT 8.0        | 1000       |      72.69 μs |     2.358 μs |      6.840 μs |      70.76 μs |
 WithOrderedPLINQ | NativeAOT 8.0        | NativeAOT 8.0        | 1000       |     153.83 μs |     4.767 μs |     13.906 μs |     149.32 μs |
 **WithLINQ**         | **.NET 8.0**             | **.NET 8.0**             | **10000**      |     **334.82 μs** |     **6.555 μs** |     **16.202 μs** |     **331.72 μs** |
 WithPLINQ        | .NET 8.0             | .NET 8.0             | 10000      |     224.82 μs |     8.006 μs |     23.227 μs |     223.34 μs |
 WithOrderedPLINQ | .NET 8.0             | .NET 8.0             | 10000      |     433.16 μs |    21.772 μs |     64.196 μs |     433.54 μs |
 WithLINQ         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10000      |     428.80 μs |     7.304 μs |     13.896 μs |     424.07 μs |
 WithPLINQ        | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10000      |   1,133.37 μs |    26.793 μs |     79.001 μs |   1,120.91 μs |
 WithOrderedPLINQ | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10000      |   1,311.67 μs |    32.881 μs |     95.916 μs |   1,329.37 μs |
 WithLINQ         | NativeAOT 8.0        | NativeAOT 8.0        | 10000      |     376.44 μs |     3.139 μs |      2.621 μs |     375.79 μs |
 WithPLINQ        | NativeAOT 8.0        | NativeAOT 8.0        | 10000      |     262.96 μs |    10.311 μs |     30.404 μs |     262.60 μs |
 WithOrderedPLINQ | NativeAOT 8.0        | NativeAOT 8.0        | 10000      |     334.03 μs |    12.012 μs |     35.417 μs |     329.75 μs |
 **WithLINQ**         | **.NET 8.0**             | **.NET 8.0**             | **100000**     |   **6,754.07 μs** |   **132.543 μs** |    **255.365 μs** |   **6,721.23 μs** |
 WithPLINQ        | .NET 8.0             | .NET 8.0             | 100000     |   1,843.33 μs |    36.377 μs |     48.563 μs |   1,836.75 μs |
 WithOrderedPLINQ | .NET 8.0             | .NET 8.0             | 100000     |   3,040.70 μs |    95.952 μs |    275.304 μs |   3,045.96 μs |
 WithLINQ         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100000     |   8,035.14 μs |   250.001 μs |    733.210 μs |   7,831.65 μs |
 WithPLINQ        | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100000     |   4,765.94 μs |   164.495 μs |    485.018 μs |   4,774.22 μs |
 WithOrderedPLINQ | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100000     |   5,904.86 μs |   164.470 μs |    484.943 μs |   6,021.04 μs |
 WithLINQ         | NativeAOT 8.0        | NativeAOT 8.0        | 100000     |   7,138.06 μs |   140.363 μs |    311.034 μs |   7,063.47 μs |
 WithPLINQ        | NativeAOT 8.0        | NativeAOT 8.0        | 100000     |   2,115.22 μs |    70.266 μs |    199.333 μs |   2,113.57 μs |
 WithOrderedPLINQ | NativeAOT 8.0        | NativeAOT 8.0        | 100000     |   2,403.26 μs |    95.124 μs |    274.455 μs |   2,362.64 μs |
 **WithLINQ**         | **.NET 8.0**             | **.NET 8.0**             | **1000000**    | **148,711.88 μs** | **2,444.434 μs** |  **2,286.525 μs** | **148,616.70 μs** |
 WithPLINQ        | .NET 8.0             | .NET 8.0             | 1000000    |  39,863.54 μs | 1,769.443 μs |  5,019.614 μs |  39,276.95 μs |
 WithOrderedPLINQ | .NET 8.0             | .NET 8.0             | 1000000    |  48,792.93 μs | 2,033.695 μs |  5,996.395 μs |  48,130.87 μs |
 WithLINQ         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 1000000    | 163,942.69 μs | 3,856.506 μs | 10,814.056 μs | 161,018.23 μs |
 WithPLINQ        | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 1000000    |  49,919.07 μs | 1,300.465 μs |  3,834.450 μs |  48,826.74 μs |
 WithOrderedPLINQ | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 1000000    |  57,348.93 μs | 1,418.665 μs |  4,182.967 μs |  57,813.21 μs |
 WithLINQ         | NativeAOT 8.0        | NativeAOT 8.0        | 1000000    | 151,952.46 μs | 2,531.697 μs |  2,708.887 μs | 152,063.94 μs |
 WithPLINQ        | NativeAOT 8.0        | NativeAOT 8.0        | 1000000    |  39,872.16 μs |   720.675 μs |    674.119 μs |  39,921.46 μs |
 WithOrderedPLINQ | NativeAOT 8.0        | NativeAOT 8.0        | 1000000    |  37,557.03 μs |   729.918 μs |  1,069.904 μs |  37,346.80 μs |
