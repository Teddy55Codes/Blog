```

BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
AMD EPYC 7R32, 1 CPU, 32 logical and 16 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2

Job=.NET 8.0  Runtime=.NET 8.0  

```
| Method                                    | cost | iterations | Mean         | Error     | StdDev    |
|------------------------------------------ |----- |----------- |-------------:|----------:|----------:|
| **RegularForBCrypt**                          | **4**    | **300**        |    **378.66 ms** |  **0.261 ms** |  **0.218 ms** |
| ParallelForBCrypt                         | 4    | 300        |     19.28 ms |  0.361 ms |  0.320 ms |
| ParallelOptimizedForSmallOperationsBCrypt | 4    | 300        |     18.23 ms |  0.111 ms |  0.103 ms |
| **RegularForBCrypt**                          | **6**    | **300**        |  **1,455.24 ms** |  **1.156 ms** |  **1.081 ms** |
| ParallelForBCrypt                         | 6    | 300        |     68.28 ms |  1.062 ms |  0.994 ms |
| ParallelOptimizedForSmallOperationsBCrypt | 6    | 300        |     66.32 ms |  1.266 ms |  1.184 ms |
| **RegularForBCrypt**                          | **8**    | **300**        |  **5,761.81 ms** |  **4.404 ms** |  **4.120 ms** |
| ParallelForBCrypt                         | 8    | 300        |    261.90 ms |  5.022 ms |  5.784 ms |
| ParallelOptimizedForSmallOperationsBCrypt | 8    | 300        |    268.41 ms |  1.279 ms |  1.068 ms |
| **RegularForBCrypt**                          | **10**   | **300**        | **22,978.52 ms** | **13.472 ms** | **12.602 ms** |
| ParallelForBCrypt                         | 10   | 300        |  1,014.52 ms | 20.263 ms | 50.085 ms |
| ParallelOptimizedForSmallOperationsBCrypt | 10   | 300        |  1,011.91 ms | 20.070 ms | 45.710 ms |
