```

BenchmarkDotNet v0.13.12, Windows 10 (10.0.19045.4291/22H2/2022Update)
Intel Core i7-9750H CPU 2.60GHz, 1 CPU, 12 logical and 6 physical cores
.NET SDK 9.0.100-preview.3.24204.13
  [Host]               : .NET 8.0.4 (8.0.424.16909), X64 RyuJIT AVX2
  .NET 8.0             : .NET 8.0.4 (8.0.424.16909), X64 RyuJIT AVX2
  .NET Framework 4.8.1 : .NET Framework 4.8.1 (4.8.9232.0), X64 RyuJIT VectorSize=256
  NativeAOT 8.0        : .NET 8.0.2, X64 NativeAOT AVX2


```
| Method      | Job                  | Runtime              | EnumerableLength | Mean         | Error        | StdDev       | Median       |
|------------ |--------------------- |--------------------- |----------------- |-------------:|-------------:|-------------:|-------------:|
| **Switching**   | **.NET 8.0**             | **.NET 8.0**             | **10000**            |     **328.5 μs** |      **5.86 μs** |      **5.75 μs** |     **327.6 μs** |
| NoSwitching | .NET 8.0             | .NET 8.0             | 10000            |     301.8 μs |      5.54 μs |      6.38 μs |     301.2 μs |
| Switching   | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10000            |     611.1 μs |     11.99 μs |     28.02 μs |     602.2 μs |
| NoSwitching | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10000            |     613.8 μs |     12.16 μs |     26.43 μs |     612.8 μs |
| Switching   | NativeAOT 8.0        | NativeAOT 8.0        | 10000            |     353.5 μs |     19.94 μs |     57.86 μs |     337.6 μs |
| NoSwitching | NativeAOT 8.0        | NativeAOT 8.0        | 10000            |     364.1 μs |     24.55 μs |     72.39 μs |     336.9 μs |
| **Switching**   | **.NET 8.0**             | **.NET 8.0**             | **100000**           |   **4,018.5 μs** |    **277.43 μs** |    **818.00 μs** |   **3,719.1 μs** |
| NoSwitching | .NET 8.0             | .NET 8.0             | 100000           |   3,460.8 μs |     78.40 μs |    215.95 μs |   3,399.5 μs |
| Switching   | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100000           |   6,712.1 μs |    282.41 μs |    810.30 μs |   6,373.9 μs |
| NoSwitching | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100000           |   6,266.5 μs |    121.70 μs |    318.47 μs |   6,218.6 μs |
| Switching   | NativeAOT 8.0        | NativeAOT 8.0        | 100000           |   3,533.0 μs |     68.03 μs |     86.03 μs |   3,537.4 μs |
| NoSwitching | NativeAOT 8.0        | NativeAOT 8.0        | 100000           |   3,605.9 μs |     74.69 μs |    217.89 μs |   3,560.4 μs |
| **Switching**   | **.NET 8.0**             | **.NET 8.0**             | **1000000**          |  **32,809.7 μs** |    **616.48 μs** |  **1,273.14 μs** |  **32,738.3 μs** |
| NoSwitching | .NET 8.0             | .NET 8.0             | 1000000          |  31,759.2 μs |    628.41 μs |  1,032.50 μs |  31,653.8 μs |
| Switching   | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 1000000          |  65,161.0 μs |  2,466.39 μs |  6,875.30 μs |  62,024.6 μs |
| NoSwitching | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 1000000          |  60,081.0 μs |  1,191.47 μs |  2,808.43 μs |  59,656.6 μs |
| Switching   | NativeAOT 8.0        | NativeAOT 8.0        | 1000000          |  31,407.0 μs |    612.12 μs |    572.58 μs |  31,471.2 μs |
| NoSwitching | NativeAOT 8.0        | NativeAOT 8.0        | 1000000          |  32,440.4 μs |    636.72 μs |    707.72 μs |  32,220.4 μs |
| **Switching**   | **.NET 8.0**             | **.NET 8.0**             | **10000000**         | **328,634.5 μs** |  **4,354.28 μs** |  **3,636.02 μs** | **328,169.5 μs** |
| NoSwitching | .NET 8.0             | .NET 8.0             | 10000000         | 343,483.8 μs |  5,978.03 μs |  5,591.86 μs | 342,004.8 μs |
| Switching   | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10000000         | 616,504.6 μs | 11,211.35 μs | 10,487.10 μs | 614,990.2 μs |
| NoSwitching | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10000000         | 629,539.7 μs | 11,885.03 μs | 11,672.68 μs | 631,908.1 μs |
| Switching   | NativeAOT 8.0        | NativeAOT 8.0        | 10000000         | 324,316.1 μs |  6,250.77 μs | 10,093.84 μs | 321,715.0 μs |
| NoSwitching | NativeAOT 8.0        | NativeAOT 8.0        | 10000000         | 338,257.6 μs |  6,717.52 μs | 12,113.08 μs | 335,863.0 μs |
