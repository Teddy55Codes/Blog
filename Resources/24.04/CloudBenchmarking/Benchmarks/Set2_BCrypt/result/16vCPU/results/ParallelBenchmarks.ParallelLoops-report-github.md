```

BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
AMD EPYC 7R32, 1 CPU, 16 logical and 8 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2

Job=.NET 8.0  Runtime=.NET 8.0  

```
| Method                                    | cost | iterations | Mean         | Error     | StdDev    |
|------------------------------------------ |----- |----------- |-------------:|----------:|----------:|
| **RegularForBCrypt**                          | **4**    | **300**        |    **378.75 ms** |  **0.117 ms** |  **0.103 ms** |
| ParallelForBCrypt                         | 4    | 300        |     36.38 ms |  0.681 ms |  0.637 ms |
| ParallelOptimizedForSmallOperationsBCrypt | 4    | 300        |     33.67 ms |  0.307 ms |  0.287 ms |
| **RegularForBCrypt**                          | **6**    | **300**        |  **1,453.45 ms** |  **0.937 ms** |  **0.783 ms** |
| ParallelForBCrypt                         | 6    | 300        |    135.36 ms |  2.682 ms |  2.634 ms |
| ParallelOptimizedForSmallOperationsBCrypt | 6    | 300        |    123.93 ms |  0.917 ms |  0.813 ms |
| **RegularForBCrypt**                          | **8**    | **300**        |  **5,765.37 ms** |  **6.101 ms** |  **5.707 ms** |
| ParallelForBCrypt                         | 8    | 300        |    498.56 ms |  9.957 ms | 17.176 ms |
| ParallelOptimizedForSmallOperationsBCrypt | 8    | 300        |    505.04 ms | 10.066 ms | 22.095 ms |
| **RegularForBCrypt**                          | **10**   | **300**        | **22,984.86 ms** |  **6.202 ms** |  **5.802 ms** |
| ParallelForBCrypt                         | 10   | 300        |  1,894.39 ms | 36.007 ms | 66.742 ms |
| ParallelOptimizedForSmallOperationsBCrypt | 10   | 300        |  1,863.87 ms | 29.275 ms | 25.951 ms |
