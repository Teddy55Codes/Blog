```

BenchmarkDotNet v0.13.12, Windows 10 (10.0.19045.4291/22H2/2022Update)
Intel Core i7-9750H CPU 2.60GHz, 1 CPU, 12 logical and 6 physical cores
.NET SDK 9.0.100-preview.3.24204.13
  [Host]               : .NET 8.0.4 (8.0.424.16909), X64 RyuJIT AVX2
  .NET 8.0             : .NET 8.0.4 (8.0.424.16909), X64 RyuJIT AVX2
  .NET Framework 4.8.1 : .NET Framework 4.8.1 (4.8.9232.0), X64 RyuJIT VectorSize=256
  NativeAOT 8.0        : .NET 8.0.2, X64 NativeAOT AVX2


```
| Method                                    | Job                  | Runtime              | cost | iterations | Mean              | Error           | StdDev          | Median            |
|------------------------------------------ |--------------------- |--------------------- |----- |----------- |------------------:|----------------:|----------------:|------------------:|
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **4**    | **5**          |      **5,673.441 μs** |      **85.2563 μs** |      **75.5775 μs** |      **5,640.866 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 4    | 5          |      1,778.922 μs |      55.2513 μs |     159.4126 μs |      1,757.801 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 4    | 5          |      1,907.423 μs |      54.2165 μs |     155.5574 μs |      1,913.186 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 5          |      6,765.380 μs |     202.4620 μs |     547.3679 μs |      6,670.204 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 5          |      2,235.149 μs |      44.4432 μs |      57.7887 μs |      2,234.542 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 5          |      2,493.148 μs |      55.5364 μs |     159.3444 μs |      2,479.962 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 5          |      6,140.576 μs |     132.1794 μs |     350.5210 μs |      6,064.501 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 5          |      1,831.172 μs |      48.0716 μs |     135.5867 μs |      1,817.641 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 5          |      1,924.060 μs |      91.5906 μs |     264.2598 μs |      1,860.946 μs |
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **4**    | **10**         |     **11,983.725 μs** |     **517.6607 μs** |   **1,476.9151 μs** |     **11,499.040 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 4    | 10         |      2,767.699 μs |     125.0834 μs |     368.8112 μs |      2,641.905 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 4    | 10         |      2,761.867 μs |      96.3999 μs |     282.7243 μs |      2,742.966 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 10         |     13,632.149 μs |     268.7475 μs |     287.5568 μs |     13,543.107 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 10         |      3,003.743 μs |     102.5792 μs |     299.2284 μs |      2,967.228 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 10         |      4,351.087 μs |     190.3509 μs |     561.2540 μs |      4,120.964 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 10         |     11,434.943 μs |     227.5596 μs |     607.4026 μs |     11,348.523 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 10         |      2,538.514 μs |      68.1711 μs |     201.0039 μs |      2,528.873 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 10         |      2,885.425 μs |     131.9684 μs |     384.9581 μs |      2,748.545 μs |
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **4**    | **100**        |    **116,911.184 μs** |   **2,330.7766 μs** |   **4,546.0008 μs** |    **116,720.040 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 4    | 100        |     24,756.019 μs |     493.6527 μs |   1,274.2753 μs |     24,777.516 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 4    | 100        |     27,390.935 μs |     764.0071 μs |   2,252.6923 μs |     27,183.858 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 100        |    122,644.033 μs |   1,866.1916 μs |   1,745.6368 μs |    123,012.350 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 100        |     26,516.296 μs |     527.3062 μs |   1,146.3204 μs |     26,593.872 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 100        |     32,817.456 μs |     904.2208 μs |   2,666.1154 μs |     32,571.247 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 100        |    105,897.362 μs |   1,634.6721 μs |   1,365.0253 μs |    105,885.940 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 100        |     23,714.922 μs |     472.5694 μs |   1,176.8619 μs |     23,704.081 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 100        |     25,281.401 μs |     565.6186 μs |   1,667.7393 μs |     25,351.691 μs |
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **4**    | **500**        |    **622,081.646 μs** |  **25,927.8844 μs** |  **76,041.9966 μs** |    **601,744.500 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 4    | 500        |    120,832.596 μs |   2,389.7602 μs |   4,772.6093 μs |    120,129.440 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 4    | 500        |    107,913.604 μs |   2,153.5058 μs |   2,800.1659 μs |    107,358.575 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 500        |    600,589.845 μs |  11,756.2425 μs |  14,437.7215 μs |    593,481.650 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 500        |    117,935.485 μs |   2,197.6716 μs |   2,055.7034 μs |    117,892.060 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 500        |    131,850.425 μs |   2,595.2099 μs |   2,884.5689 μs |    132,289.625 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 500        |    522,195.780 μs |   8,666.5978 μs |   8,106.7410 μs |    517,870.500 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 500        |    106,718.275 μs |   1,228.0783 μs |   1,148.7452 μs |    106,391.720 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 500        |    106,922.159 μs |   2,132.4477 μs |   1,994.6929 μs |    107,150.780 μs |
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **4**    | **1000**       |  **1,035,273.300 μs** |  **14,653.4317 μs** |  **12,989.8855 μs** |  **1,030,409.250 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 4    | 1000       |    217,335.370 μs |   4,315.2501 μs |   4,796.3891 μs |    216,526.400 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 4    | 1000       |    220,084.755 μs |   4,346.3502 μs |   5,005.2633 μs |    219,013.450 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 1000       |  1,288,757.171 μs |  25,661.7766 μs |  65,780.9438 μs |  1,274,129.000 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 1000       |    252,962.587 μs |   3,480.2550 μs |   3,255.4327 μs |    253,749.100 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 1000       |    279,411.561 μs |   5,272.6847 μs |   5,641.7135 μs |    279,186.350 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 1000       |  1,134,949.593 μs |  22,694.3053 μs |  62,506.7076 μs |  1,121,100.900 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 1000       |    228,955.969 μs |   4,413.5965 μs |   3,912.5383 μs |    228,491.817 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 1000       |    214,528.765 μs |   4,279.0239 μs |  11,121.7522 μs |    213,187.067 μs |
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **4**    | **10000**      | **11,745,192.332 μs** | **234,107.8479 μs** | **620,820.8018 μs** | **11,583,202.700 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 4    | 10000      |  2,137,591.400 μs |  42,529.0588 μs |  79,879.8813 μs |  2,133,384.900 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 4    | 10000      |  2,418,063.437 μs |  72,631.7768 μs | 213,016.4282 μs |  2,388,914.000 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 10000      | 13,423,464.357 μs | 267,231.9972 μs | 736,034.5290 μs | 13,343,851.200 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 10000      |  2,079,573.713 μs |  26,646.0433 μs |  24,924.7255 μs |  2,074,129.100 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 4    | 10000      |  2,606,170.807 μs |  49,687.3761 μs |  46,477.6025 μs |  2,611,708.000 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 10000      | 11,539,250.919 μs | 228,875.6608 μs | 320,851.7112 μs | 11,497,891.800 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 10000      |  1,975,532.200 μs |  39,048.9599 μs |  66,308.0975 μs |  1,961,083.700 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 4    | 10000      |  2,050,733.304 μs |  40,287.9986 μs |  50,951.4186 μs |  2,042,676.200 μs |
| **RegularFor**                                | **.NET 8.0**             | **.NET 8.0**             | **?**    | **5**          |          **3.803 μs** |       **0.0756 μs** |       **0.1753 μs** |          **3.826 μs** |
| ParallelFor                               | .NET 8.0             | .NET 8.0             | ?    | 5          |          7.519 μs |       0.1477 μs |       0.1972 μs |          7.524 μs |
| ParallelOptimizedForSmallOperations       | .NET 8.0             | .NET 8.0             | ?    | 5          |          6.810 μs |       0.1352 μs |       0.1198 μs |          6.787 μs |
| RegularFor                                | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 5          |         11.869 μs |       0.1867 μs |       0.1559 μs |         11.924 μs |
| ParallelFor                               | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 5          |         26.641 μs |       0.5141 μs |       0.5279 μs |         26.519 μs |
| ParallelOptimizedForSmallOperations       | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 5          |         26.008 μs |       0.5119 μs |       0.4788 μs |         25.977 μs |
| RegularFor                                | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 5          |          3.802 μs |       0.0728 μs |       0.0715 μs |          3.785 μs |
| ParallelFor                               | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 5          |         12.918 μs |       0.3963 μs |       1.1559 μs |         13.086 μs |
| ParallelOptimizedForSmallOperations       | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 5          |         13.718 μs |       0.3138 μs |       0.9103 μs |         13.808 μs |
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **7**    | **5**          |     **45,175.100 μs** |     **899.8136 μs** |   **1,503.3865 μs** |     **45,474.146 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 7    | 5          |     12,517.781 μs |     452.7352 μs |   1,334.8999 μs |     12,301.343 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 7    | 5          |     11,681.118 μs |     274.7354 μs |     810.0637 μs |     11,440.440 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 7    | 5          |     45,465.087 μs |     875.2328 μs |   1,106.8892 μs |     44,765.264 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 7    | 5          |     14,233.840 μs |     281.5950 μs |     669.2402 μs |     14,020.652 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 7    | 5          |     14,372.830 μs |     323.1299 μs |     932.3038 μs |     14,280.433 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 7    | 5          |     38,835.595 μs |     403.2014 μs |     377.1548 μs |     38,699.246 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 7    | 5          |     11,033.378 μs |     171.4547 μs |     151.9901 μs |     11,035.652 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 7    | 5          |     10,572.646 μs |     132.5394 μs |     117.4928 μs |     10,538.057 μs |
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **7**    | **10**         |     **77,041.611 μs** |     **390.6378 μs** |     **326.2002 μs** |     **77,067.200 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 7    | 10         |     17,718.472 μs |     277.8208 μs |     259.8737 μs |     17,676.056 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 7    | 10         |     16,194.641 μs |     272.8693 μs |     255.2421 μs |     16,143.397 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 7    | 10         |     88,515.923 μs |     449.6773 μs |     420.6285 μs |     88,518.500 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 7    | 10         |     18,826.758 μs |     264.3128 μs |     234.3064 μs |     18,808.125 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 7    | 10         |     20,579.150 μs |     317.6590 μs |     297.1385 μs |     20,600.772 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 7    | 10         |     77,193.043 μs |     474.6562 μs |     420.7704 μs |     77,184.529 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 7    | 10         |     16,924.686 μs |     204.5790 μs |     191.3634 μs |     16,909.597 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 7    | 10         |     16,322.747 μs |     258.0768 μs |     241.4052 μs |     16,296.178 μs |
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **7**    | **100**        |    **774,469.300 μs** |   **6,291.6305 μs** |   **5,885.1950 μs** |    **772,597.700 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 7    | 100        |    164,595.212 μs |   3,278.4334 μs |   7,196.2408 μs |    165,387.250 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 7    | 100        |    159,860.694 μs |   3,035.2844 μs |   2,981.0552 μs |    159,815.200 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 7    | 100        |    901,043.412 μs |  17,753.7177 μs |  17,436.5246 μs |    892,746.650 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 7    | 100        |    188,581.859 μs |   3,452.0234 μs |   4,239.3948 μs |    189,242.817 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 7    | 100        |    197,165.829 μs |   3,806.6942 μs |   5,210.6460 μs |    196,450.517 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 7    | 100        |    771,936.458 μs |   3,184.2227 μs |   2,486.0317 μs |    771,920.800 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 7    | 100        |    160,202.720 μs |   3,098.9621 μs |   3,043.5952 μs |    159,931.462 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 7    | 100        |    163,470.195 μs |   2,100.3961 μs |   1,964.7119 μs |    163,967.000 μs |
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **7**    | **500**        |  **4,850,174.907 μs** | **130,799.0430 μs** | **385,663.9294 μs** |  **4,890,219.850 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 7    | 500        |  1,062,788.784 μs |  21,013.0794 μs |  45,680.7052 μs |  1,055,719.100 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 7    | 500        |    997,717.097 μs |  19,739.7207 μs |  54,368.9236 μs |    988,138.000 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 7    | 500        |  5,790,285.041 μs | 113,729.3472 μs | 193,121.0628 μs |  5,781,695.700 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 7    | 500        |  1,094,058.649 μs |  20,953.6479 μs |  39,866.4928 μs |  1,089,309.600 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 7    | 500        |  1,274,607.724 μs |  21,168.6472 μs |  25,199.7686 μs |  1,277,076.500 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 7    | 500        |  4,940,059.957 μs |  94,746.1281 μs |  83,989.9747 μs |  4,958,388.900 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 7    | 500        |  1,003,333.419 μs |  19,900.7626 μs |  41,098.5257 μs |    995,501.150 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 7    | 500        |  1,016,701.184 μs |  20,288.7905 μs |  43,237.0667 μs |  1,016,407.100 μs |
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **10**   | **5**          |    **419,390.265 μs** |   **8,365.7238 μs** |   **9,633.9800 μs** |    **418,724.200 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 10   | 5          |    111,534.985 μs |   2,564.4859 μs |   7,233.1779 μs |    110,245.637 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 10   | 5          |    106,877.134 μs |   2,102.7631 μs |   3,791.7156 μs |    106,524.340 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10   | 5          |    408,585.773 μs |   7,848.8091 μs |   7,341.7809 μs |    404,743.300 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10   | 5          |    136,293.120 μs |   3,583.8037 μs |  10,454.1237 μs |    133,631.538 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10   | 5          |    138,151.288 μs |   3,072.4124 μs |   9,010.8538 μs |    136,939.825 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 10   | 5          |    338,277.869 μs |   6,549.9109 μs |   6,432.8883 μs |    338,755.600 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 10   | 5          |    104,660.875 μs |     870.2763 μs |     726.7201 μs |    104,701.180 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 10   | 5          |    103,762.840 μs |   1,427.5923 μs |   1,192.1042 μs |    103,563.580 μs |
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **10**   | **10**         |    **666,641.853 μs** |   **8,254.0254 μs** |   **7,720.8204 μs** |    **667,319.400 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 10   | 10         |    170,725.684 μs |   3,176.8065 μs |   6,906.1158 μs |    168,396.533 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 10   | 10         |    160,838.798 μs |   2,429.3354 μs |   2,272.4018 μs |    161,356.600 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10   | 10         |    811,863.838 μs |   7,464.1788 μs |   6,232.9273 μs |    812,083.000 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10   | 10         |    190,593.995 μs |   3,499.0330 μs |   5,447.5729 μs |    189,906.500 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10   | 10         |    213,014.842 μs |   4,005.2571 μs |   3,746.5200 μs |    211,601.000 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 10   | 10         |    701,939.197 μs |  13,950.7601 μs |  21,304.2841 μs |    696,934.300 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 10   | 10         |    161,268.689 μs |   3,116.3130 μs |   3,334.4200 μs |    160,315.567 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 10   | 10         |    174,464.722 μs |   3,407.0324 μs |   9,830.0676 μs |    171,662.725 μs |
| **RegularForBCrypt**                          | **.NET 8.0**             | **.NET 8.0**             | **10**   | **100**        |  **6,949,812.845 μs** | **136,303.1792 μs** | **256,010.4097 μs** |  **6,896,142.950 μs** |
| ParallelForBCrypt                         | .NET 8.0             | .NET 8.0             | 10   | 100        |  1,443,584.324 μs |  41,265.5820 μs | 121,672.4995 μs |  1,462,146.950 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET 8.0             | .NET 8.0             | 10   | 100        |  1,557,921.965 μs |  27,648.0100 μs |  31,839.4894 μs |  1,551,395.100 μs |
| RegularForBCrypt                          | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10   | 100        |  8,338,699.428 μs | 164,730.3391 μs | 219,910.2711 μs |  8,296,618.400 μs |
| ParallelForBCrypt                         | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10   | 100        |  1,645,699.140 μs |  48,015.0043 μs | 141,573.3235 μs |  1,668,832.800 μs |
| ParallelOptimizedForSmallOperationsBCrypt | .NET Framework 4.8.1 | .NET Framework 4.8.1 | 10   | 100        |  1,977,945.919 μs |  38,604.6104 μs |  37,914.8893 μs |  1,978,770.550 μs |
| RegularForBCrypt                          | NativeAOT 8.0        | NativeAOT 8.0        | 10   | 100        |  7,104,025.734 μs | 140,393.8495 μs | 316,892.3148 μs |  7,041,584.900 μs |
| ParallelForBCrypt                         | NativeAOT 8.0        | NativeAOT 8.0        | 10   | 100        |  1,312,537.362 μs |  25,938.4003 μs |  30,877.8204 μs |  1,305,533.800 μs |
| ParallelOptimizedForSmallOperationsBCrypt | NativeAOT 8.0        | NativeAOT 8.0        | 10   | 100        |  1,527,888.337 μs |  30,155.1022 μs |  63,607.3453 μs |  1,540,860.800 μs |
| **RegularFor**                                | **.NET 8.0**             | **.NET 8.0**             | **?**    | **10**         |          **9.826 μs** |       **0.5345 μs** |       **1.5760 μs** |          **9.064 μs** |
| ParallelFor                               | .NET 8.0             | .NET 8.0             | ?    | 10         |         13.198 μs |       0.2614 μs |       0.3305 μs |         13.195 μs |
| ParallelOptimizedForSmallOperations       | .NET 8.0             | .NET 8.0             | ?    | 10         |         12.385 μs |       0.5683 μs |       1.5462 μs |         12.020 μs |
| RegularFor                                | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 10         |         26.496 μs |       0.8796 μs |       2.3780 μs |         25.762 μs |
| ParallelFor                               | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 10         |         47.018 μs |       0.5518 μs |       0.5161 μs |         46.931 μs |
| ParallelOptimizedForSmallOperations       | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 10         |         44.770 μs |       0.8923 μs |       1.3079 μs |         44.699 μs |
| RegularFor                                | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 10         |          9.835 μs |       0.2228 μs |       0.6429 μs |          9.687 μs |
| ParallelFor                               | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 10         |         20.945 μs |       0.5295 μs |       1.5447 μs |         20.986 μs |
| ParallelOptimizedForSmallOperations       | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 10         |         23.396 μs |       0.5780 μs |       1.6490 μs |         23.358 μs |
| **RegularFor**                                | **.NET 8.0**             | **.NET 8.0**             | **?**    | **100**        |         **90.251 μs** |       **1.8026 μs** |       **4.6206 μs** |         **88.284 μs** |
| ParallelFor                               | .NET 8.0             | .NET 8.0             | ?    | 100        |         64.982 μs |       0.8514 μs |       0.7964 μs |         64.964 μs |
| ParallelOptimizedForSmallOperations       | .NET 8.0             | .NET 8.0             | ?    | 100        |         69.038 μs |       3.2529 μs |       9.5912 μs |         67.977 μs |
| RegularFor                                | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 100        |        304.178 μs |       7.5603 μs |      22.1730 μs |        299.380 μs |
| ParallelFor                               | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 100        |        212.055 μs |       5.5939 μs |      16.4937 μs |        211.806 μs |
| ParallelOptimizedForSmallOperations       | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 100        |        156.500 μs |       3.0925 μs |       5.7321 μs |        156.536 μs |
| RegularFor                                | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 100        |         88.138 μs |       1.7142 μs |       2.1051 μs |         88.049 μs |
| ParallelFor                               | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 100        |         83.483 μs |       1.6599 μs |       4.5159 μs |         82.985 μs |
| ParallelOptimizedForSmallOperations       | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 100        |         85.566 μs |       1.6657 μs |       3.2488 μs |         84.965 μs |
| **RegularFor**                                | **.NET 8.0**             | **.NET 8.0**             | **?**    | **500**        |        **426.615 μs** |       **8.5272 μs** |      **18.3558 μs** |        **422.434 μs** |
| ParallelFor                               | .NET 8.0             | .NET 8.0             | ?    | 500        |        248.307 μs |       7.7877 μs |      22.5934 μs |        242.426 μs |
| ParallelOptimizedForSmallOperations       | .NET 8.0             | .NET 8.0             | ?    | 500        |        251.673 μs |       4.9972 μs |      13.9301 μs |        250.767 μs |
| RegularFor                                | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 500        |      1,360.606 μs |      26.8646 μs |      41.8249 μs |      1,347.288 μs |
| ParallelFor                               | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 500        |        622.816 μs |      12.1905 μs |      11.4030 μs |        622.533 μs |
| ParallelOptimizedForSmallOperations       | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 500        |        709.265 μs |      14.9909 μs |      43.4915 μs |        708.450 μs |
| RegularFor                                | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 500        |        447.837 μs |       8.8322 μs |      13.2196 μs |        442.634 μs |
| ParallelFor                               | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 500        |        317.497 μs |      10.3153 μs |      29.9266 μs |        316.246 μs |
| ParallelOptimizedForSmallOperations       | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 500        |        314.433 μs |       7.3965 μs |      21.6927 μs |        320.045 μs |
| **RegularFor**                                | **.NET 8.0**             | **.NET 8.0**             | **?**    | **1000**       |        **831.367 μs** |      **13.0509 μs** |      **12.2078 μs** |        **832.189 μs** |
| ParallelFor                               | .NET 8.0             | .NET 8.0             | ?    | 1000       |        485.958 μs |      16.2655 μs |      47.9593 μs |        483.617 μs |
| ParallelOptimizedForSmallOperations       | .NET 8.0             | .NET 8.0             | ?    | 1000       |        500.947 μs |      14.2012 μs |      41.8727 μs |        504.519 μs |
| RegularFor                                | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 1000       |      2,717.234 μs |      40.8895 μs |      34.1446 μs |      2,727.446 μs |
| ParallelFor                               | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 1000       |      1,251.162 μs |      39.0366 μs |     113.2522 μs |      1,248.137 μs |
| ParallelOptimizedForSmallOperations       | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 1000       |      1,290.320 μs |      25.8378 μs |      76.1835 μs |      1,289.002 μs |
| RegularFor                                | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 1000       |        892.731 μs |      17.1074 μs |      36.4573 μs |        884.269 μs |
| ParallelFor                               | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 1000       |        457.304 μs |       9.0236 μs |      10.7420 μs |        459.619 μs |
| ParallelOptimizedForSmallOperations       | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 1000       |        469.470 μs |       9.3631 μs |      26.2553 μs |        478.087 μs |
| **RegularFor**                                | **.NET 8.0**             | **.NET 8.0**             | **?**    | **10000**      |      **8,537.969 μs** |     **166.1007 μs** |     **253.6533 μs** |      **8,456.178 μs** |
| ParallelFor                               | .NET 8.0             | .NET 8.0             | ?    | 10000      |      4,210.069 μs |      84.0277 μs |     161.8929 μs |      4,206.241 μs |
| ParallelOptimizedForSmallOperations       | .NET 8.0             | .NET 8.0             | ?    | 10000      |      4,180.433 μs |      67.3615 μs |      85.1907 μs |      4,174.757 μs |
| RegularFor                                | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 10000      |     26,435.467 μs |     299.7093 μs |     280.3483 μs |     26,457.088 μs |
| ParallelFor                               | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 10000      |      9,886.193 μs |     189.5754 μs |     253.0778 μs |      9,944.903 μs |
| ParallelOptimizedForSmallOperations       | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 10000      |      9,815.500 μs |     187.8973 μs |     216.3828 μs |      9,798.865 μs |
| RegularFor                                | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 10000      |      8,905.278 μs |     163.7812 μs |     286.8496 μs |      8,828.006 μs |
| ParallelFor                               | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 10000      |      4,138.912 μs |      82.0062 μs |     143.6272 μs |      4,106.248 μs |
| ParallelOptimizedForSmallOperations       | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 10000      |      4,255.901 μs |      84.0814 μs |     193.1909 μs |      4,171.399 μs |
| **RegularFor**                                | **.NET 8.0**             | **.NET 8.0**             | **?**    | **100000**     |     **80,395.358 μs** |     **980.8852 μs** |     **819.0836 μs** |     **80,204.729 μs** |
| ParallelFor                               | .NET 8.0             | .NET 8.0             | ?    | 100000     |     38,997.447 μs |     768.3246 μs |   1,051.6914 μs |     38,954.557 μs |
| ParallelOptimizedForSmallOperations       | .NET 8.0             | .NET 8.0             | ?    | 100000     |     45,518.278 μs |   1,289.1673 μs |   3,698.8627 μs |     45,183.558 μs |
| RegularFor                                | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 100000     |    274,148.671 μs |   5,398.6798 μs |   7,742.6252 μs |    272,995.225 μs |
| ParallelFor                               | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 100000     |    102,042.566 μs |   3,040.8146 μs |   8,675.6150 μs |    100,556.330 μs |
| ParallelOptimizedForSmallOperations       | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 100000     |    107,950.180 μs |   3,308.0208 μs |   9,753.7741 μs |    109,292.950 μs |
| RegularFor                                | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 100000     |     88,702.714 μs |   1,729.7059 μs |   2,187.5242 μs |     87,857.617 μs |
| ParallelFor                               | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 100000     |     40,907.134 μs |     809.7704 μs |   1,672.3164 μs |     40,844.981 μs |
| ParallelOptimizedForSmallOperations       | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 100000     |     42,104.066 μs |   1,035.8588 μs |   3,054.2530 μs |     41,518.236 μs |
| **RegularFor**                                | **.NET 8.0**             | **.NET 8.0**             | **?**    | **1000000**    |    **834,652.693 μs** |  **10,365.2782 μs** |   **9,188.5491 μs** |    **834,145.000 μs** |
| ParallelFor                               | .NET 8.0             | .NET 8.0             | ?    | 1000000    |    407,643.984 μs |  10,090.4472 μs |  29,751.9113 μs |    397,037.900 μs |
| ParallelOptimizedForSmallOperations       | .NET 8.0             | .NET 8.0             | ?    | 1000000    |    397,906.653 μs |   9,601.8748 μs |  28,311.3445 μs |    386,474.250 μs |
| RegularFor                                | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 1000000    |  2,661,995.667 μs |  32,773.7485 μs |  30,656.5847 μs |  2,652,550.200 μs |
| ParallelFor                               | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 1000000    |    987,643.568 μs |  36,715.8837 μs | 102,955.2743 μs |    940,712.000 μs |
| ParallelOptimizedForSmallOperations       | .NET Framework 4.8.1 | .NET Framework 4.8.1 | ?    | 1000000    |    985,306.952 μs |  27,129.6541 μs |  76,962.3132 μs |    954,986.300 μs |
| RegularFor                                | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 1000000    |    869,136.541 μs |  14,466.0714 μs |  14,855.5903 μs |    870,410.300 μs |
| ParallelFor                               | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 1000000    |    408,670.613 μs |   7,840.9413 μs |   8,715.1855 μs |    408,875.750 μs |
| ParallelOptimizedForSmallOperations       | NativeAOT 8.0        | NativeAOT 8.0        | ?    | 1000000    |    412,092.415 μs |   8,220.1488 μs |  11,251.8325 μs |    408,557.650 μs |
