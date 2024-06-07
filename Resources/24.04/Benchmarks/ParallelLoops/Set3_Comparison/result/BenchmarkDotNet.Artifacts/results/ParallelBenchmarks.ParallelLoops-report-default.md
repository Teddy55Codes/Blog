
BenchmarkDotNet v0.13.12, Windows 10 (10.0.19045.4291/22H2/2022Update)
Intel Core i7-9750H CPU 2.60GHz, 1 CPU, 12 logical and 6 physical cores
.NET SDK 9.0.100-preview.3.24204.13
  [Host]               : .NET 8.0.4 (8.0.424.16909), X64 RyuJIT AVX2
  .NET 8.0             : .NET 8.0.4 (8.0.424.16909), X64 RyuJIT AVX2
  .NET Framework 4.8.1 : .NET Framework 4.8.1 (4.8.9232.0), X64 RyuJIT VectorSize=256
  NativeAOT 8.0        : .NET 8.0.2, X64 NativeAOT AVX2


 Method                              | Job                  | Runtime              | iterations | Mean           | Error         | StdDev        | Median         |
------------------------------------ |--------------------- |--------------------- |----------- |---------------:|--------------:|--------------:|---------------:|
 **RegularFor**                          | **.NET 8.0**             | **.NET 8.0**             | **5**          |       **4.903 μs** |     **0.1398 μs** |     **0.4032 μs** |       **4.836 μs** |
 ParallelFor                         | .NET 8.0             | .NET 8.0             | 5          |       9.009 μs |     0.2107 μs |     0.6080 μs |       8.969 μs |
 ParallelForeach                     | .NET 8.0             | .NET 8.0             | 5          |       9.286 μs |     0.1968 μs |     0.5709 μs |       9.427 μs |
 ParallelOptimizedForSmallOperations | .NET 8.0             | .NET 8.0             | 5          |       9.327 μs |     0.1902 μs |     0.5579 μs |       9.489 μs |
 RegularFor                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 5          |      14.401 μs |     0.3834 μs |     1.1185 μs |      14.022 μs |
 ParallelFor                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 5          |      36.322 μs |     0.7886 μs |     2.3253 μs |      36.008 μs |
 ParallelForeach                     | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 5          |      43.142 μs |     0.8749 μs |     2.5383 μs |      42.921 μs |
 ParallelOptimizedForSmallOperations | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 5          |      36.931 μs |     0.7700 μs |     2.2705 μs |      36.787 μs |
 RegularFor                          | NativeAOT 8.0        | NativeAOT 8.0        | 5          |       4.596 μs |     0.0771 μs |     0.0721 μs |       4.582 μs |
 ParallelFor                         | NativeAOT 8.0        | NativeAOT 8.0        | 5          |      13.974 μs |     0.3755 μs |     1.1071 μs |      13.661 μs |
 ParallelForeach                     | NativeAOT 8.0        | NativeAOT 8.0        | 5          |      14.731 μs |     0.4337 μs |     1.2787 μs |      14.635 μs |
 ParallelOptimizedForSmallOperations | NativeAOT 8.0        | NativeAOT 8.0        | 5          |      13.185 μs |     0.3473 μs |     1.0130 μs |      13.137 μs |
 **RegularFor**                          | **.NET 8.0**             | **.NET 8.0**             | **10**         |       **8.194 μs** |     **0.1342 μs** |     **0.1256 μs** |       **8.160 μs** |
 ParallelFor                         | .NET 8.0             | .NET 8.0             | 10         |      14.208 μs |     0.2756 μs |     0.3385 μs |      14.320 μs |
 ParallelForeach                     | .NET 8.0             | .NET 8.0             | 10         |      13.341 μs |     0.2557 μs |     0.2625 μs |      13.288 μs |
 ParallelOptimizedForSmallOperations | .NET 8.0             | .NET 8.0             | 10         |      13.446 μs |     0.2675 μs |     0.2628 μs |      13.421 μs |
 RegularFor                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10         |      26.643 μs |     0.2841 μs |     0.2518 μs |      26.609 μs |
 ParallelFor                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10         |      47.695 μs |     0.8076 μs |     0.7554 μs |      47.469 μs |
 ParallelForeach                     | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10         |      49.521 μs |     0.8856 μs |     1.5276 μs |      48.852 μs |
 ParallelOptimizedForSmallOperations | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10         |      44.364 μs |     0.7677 μs |     0.7181 μs |      44.412 μs |
 RegularFor                          | NativeAOT 8.0        | NativeAOT 8.0        | 10         |       8.893 μs |     0.0884 μs |     0.0827 μs |       8.913 μs |
 ParallelFor                         | NativeAOT 8.0        | NativeAOT 8.0        | 10         |      19.193 μs |     0.3119 μs |     0.3467 μs |      19.157 μs |
 ParallelForeach                     | NativeAOT 8.0        | NativeAOT 8.0        | 10         |      20.028 μs |     0.3763 μs |     0.3336 μs |      19.947 μs |
 ParallelOptimizedForSmallOperations | NativeAOT 8.0        | NativeAOT 8.0        | 10         |      22.367 μs |     0.3418 μs |     0.4069 μs |      22.227 μs |
 **RegularFor**                          | **.NET 8.0**             | **.NET 8.0**             | **100**        |      **81.543 μs** |     **1.1852 μs** |     **1.1086 μs** |      **81.396 μs** |
 ParallelFor                         | .NET 8.0             | .NET 8.0             | 100        |      61.920 μs |     0.9637 μs |     0.8543 μs |      62.009 μs |
 ParallelForeach                     | .NET 8.0             | .NET 8.0             | 100        |      65.235 μs |     1.2415 μs |     1.2750 μs |      65.331 μs |
 ParallelOptimizedForSmallOperations | .NET 8.0             | .NET 8.0             | 100        |      58.899 μs |     1.1696 μs |     1.7506 μs |      58.753 μs |
 RegularFor                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100        |     269.292 μs |     4.7190 μs |     4.4141 μs |     268.834 μs |
 ParallelFor                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100        |     188.713 μs |     3.6680 μs |     4.5047 μs |     187.652 μs |
 ParallelForeach                     | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100        |     176.195 μs |     3.4843 μs |     3.2593 μs |     175.476 μs |
 ParallelOptimizedForSmallOperations | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100        |     153.998 μs |     3.0763 μs |     4.5092 μs |     154.162 μs |
 RegularFor                          | NativeAOT 8.0        | NativeAOT 8.0        | 100        |      88.942 μs |     1.6420 μs |     1.4556 μs |      88.637 μs |
 ParallelFor                         | NativeAOT 8.0        | NativeAOT 8.0        | 100        |      81.252 μs |     1.5922 μs |     1.4893 μs |      81.053 μs |
 ParallelForeach                     | NativeAOT 8.0        | NativeAOT 8.0        | 100        |      80.525 μs |     1.5948 μs |     1.7064 μs |      79.950 μs |
 ParallelOptimizedForSmallOperations | NativeAOT 8.0        | NativeAOT 8.0        | 100        |      77.468 μs |     1.5058 μs |     1.9579 μs |      76.642 μs |
 **RegularFor**                          | **.NET 8.0**             | **.NET 8.0**             | **1000**       |     **789.667 μs** |    **15.6848 μs** |    **13.9042 μs** |     **789.237 μs** |
 ParallelFor                         | .NET 8.0             | .NET 8.0             | 1000       |     471.627 μs |     6.7590 μs |     6.3223 μs |     471.269 μs |
 ParallelForeach                     | .NET 8.0             | .NET 8.0             | 1000       |     494.345 μs |     9.7527 μs |    13.9870 μs |     496.199 μs |
 ParallelOptimizedForSmallOperations | .NET 8.0             | .NET 8.0             | 1000       |     485.132 μs |    12.9394 μs |    38.1520 μs |     473.892 μs |
 RegularFor                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 1000       |   2,763.108 μs |    53.7253 μs |    63.9562 μs |   2,761.874 μs |
 ParallelFor                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 1000       |   1,200.169 μs |    27.4373 μs |    80.8996 μs |   1,201.065 μs |
 ParallelForeach                     | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 1000       |   1,291.463 μs |    35.5370 μs |   104.7816 μs |   1,290.570 μs |
 ParallelOptimizedForSmallOperations | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 1000       |   1,316.123 μs |    27.0224 μs |    79.6761 μs |   1,326.712 μs |
 RegularFor                          | NativeAOT 8.0        | NativeAOT 8.0        | 1000       |     900.788 μs |    15.2504 μs |    14.2652 μs |     895.258 μs |
 ParallelFor                         | NativeAOT 8.0        | NativeAOT 8.0        | 1000       |     490.873 μs |     9.7447 μs |    21.5936 μs |     490.404 μs |
 ParallelForeach                     | NativeAOT 8.0        | NativeAOT 8.0        | 1000       |     525.787 μs |     7.0183 μs |     5.8606 μs |     524.201 μs |
 ParallelOptimizedForSmallOperations | NativeAOT 8.0        | NativeAOT 8.0        | 1000       |     502.640 μs |     9.8252 μs |    13.4489 μs |     499.184 μs |
 **RegularFor**                          | **.NET 8.0**             | **.NET 8.0**             | **10000**      |   **8,517.197 μs** |    **68.4362 μs** |    **64.0152 μs** |   **8,524.839 μs** |
 ParallelFor                         | .NET 8.0             | .NET 8.0             | 10000      |   4,546.751 μs |    69.0836 μs |    57.6879 μs |   4,546.678 μs |
 ParallelForeach                     | .NET 8.0             | .NET 8.0             | 10000      |   4,447.118 μs |    31.9638 μs |    24.9552 μs |   4,456.153 μs |
 ParallelOptimizedForSmallOperations | .NET 8.0             | .NET 8.0             | 10000      |   4,551.887 μs |    56.6865 μs |    44.2571 μs |   4,564.664 μs |
 RegularFor                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10000      |  28,929.225 μs |   418.8027 μs |   482.2938 μs |  28,757.547 μs |
 ParallelFor                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10000      |  12,215.681 μs |   241.9349 μs |   278.6126 μs |  12,185.885 μs |
 ParallelForeach                     | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10000      |  12,079.527 μs |   188.6557 μs |   147.2899 μs |  12,095.296 μs |
 ParallelOptimizedForSmallOperations | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10000      |  11,625.082 μs |   231.0869 μs |   204.8525 μs |  11,615.434 μs |
 RegularFor                          | NativeAOT 8.0        | NativeAOT 8.0        | 10000      |   9,069.664 μs |    93.0198 μs |    87.0107 μs |   9,062.316 μs |
 ParallelFor                         | NativeAOT 8.0        | NativeAOT 8.0        | 10000      |   4,424.177 μs |    43.8436 μs |    34.2302 μs |   4,421.375 μs |
 ParallelForeach                     | NativeAOT 8.0        | NativeAOT 8.0        | 10000      |   4,355.246 μs |    57.9974 μs |    48.4305 μs |   4,359.347 μs |
 ParallelOptimizedForSmallOperations | NativeAOT 8.0        | NativeAOT 8.0        | 10000      |   4,516.652 μs |    86.9196 μs |   118.9765 μs |   4,486.559 μs |
 **RegularFor**                          | **.NET 8.0**             | **.NET 8.0**             | **100000**     | **106,127.273 μs** | **2,043.0204 μs** | **2,583.7666 μs** | **106,393.420 μs** |
 ParallelFor                         | .NET 8.0             | .NET 8.0             | 100000     |  59,080.505 μs | 1,179.4977 μs | 1,836.3359 μs |  58,975.456 μs |
 ParallelForeach                     | .NET 8.0             | .NET 8.0             | 100000     |  56,000.064 μs | 1,111.8819 μs | 2,509.7027 μs |  54,931.811 μs |
 ParallelOptimizedForSmallOperations | .NET 8.0             | .NET 8.0             | 100000     |  59,960.314 μs | 1,090.9477 μs | 1,967.2038 μs |  60,163.244 μs |
 RegularFor                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100000     | 307,794.681 μs | 5,927.1120 μs | 7,055.8052 μs | 306,772.550 μs |
 ParallelFor                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100000     | 133,030.688 μs | 2,194.3579 μs | 2,052.6038 μs | 132,388.625 μs |
 ParallelForeach                     | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100000     | 133,394.845 μs | 1,958.3055 μs | 1,735.9868 μs | 133,156.850 μs |
 ParallelOptimizedForSmallOperations | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 100000     | 135,173.220 μs | 2,611.3179 μs | 2,314.8653 μs | 134,684.438 μs |
 RegularFor                          | NativeAOT 8.0        | NativeAOT 8.0        | 100000     | 112,426.312 μs | 2,215.5515 μs | 2,370.6153 μs | 112,347.480 μs |
 ParallelFor                         | NativeAOT 8.0        | NativeAOT 8.0        | 100000     |  62,689.684 μs | 1,248.3877 μs | 1,486.1168 μs |  63,060.275 μs |
 ParallelForeach                     | NativeAOT 8.0        | NativeAOT 8.0        | 100000     |  61,727.249 μs |   962.8730 μs |   853.5619 μs |  61,929.050 μs |
 ParallelOptimizedForSmallOperations | NativeAOT 8.0        | NativeAOT 8.0        | 100000     |  60,140.962 μs | 1,177.4273 μs | 1,530.9881 μs |  60,173.806 μs |
