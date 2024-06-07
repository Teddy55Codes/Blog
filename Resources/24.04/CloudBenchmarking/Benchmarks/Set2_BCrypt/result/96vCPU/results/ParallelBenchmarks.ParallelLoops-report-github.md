```

BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
AMD EPYC 7R32, 1 CPU, 96 logical and 48 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2

Job=.NET 8.0  Runtime=.NET 8.0  

```
| Method                                    | cost | iterations | Mean          | Error      | StdDev     |
|------------------------------------------ |----- |----------- |--------------:|-----------:|-----------:|
| **RegularForBCrypt**                          | **4**    | **300**        |    **386.325 ms** |  **0.6784 ms** |  **0.6346 ms** |
| ParallelForBCrypt                         | 4    | 300        |      8.962 ms |  0.0632 ms |  0.0560 ms |
| ParallelOptimizedForSmallOperationsBCrypt | 4    | 300        |      6.949 ms |  0.0295 ms |  0.0276 ms |
| **RegularForBCrypt**                          | **6**    | **300**        |  **1,484.238 ms** |  **4.1328 ms** |  **3.8659 ms** |
| ParallelForBCrypt                         | 6    | 300        |     29.054 ms |  0.5773 ms |  0.8988 ms |
| ParallelOptimizedForSmallOperationsBCrypt | 6    | 300        |     23.906 ms |  0.1491 ms |  0.1395 ms |
| **RegularForBCrypt**                          | **8**    | **300**        |  **5,875.096 ms** |  **8.0337 ms** |  **7.5147 ms** |
| ParallelForBCrypt                         | 8    | 300        |    103.484 ms |  1.8031 ms |  3.9955 ms |
| ParallelOptimizedForSmallOperationsBCrypt | 8    | 300        |     90.572 ms |  0.9928 ms |  0.9287 ms |
| **RegularForBCrypt**                          | **10**   | **300**        | **23,442.157 ms** | **19.7226 ms** | **18.4485 ms** |
| ParallelForBCrypt                         | 10   | 300        |    511.319 ms |  9.9001 ms | 11.0040 ms |
| ParallelOptimizedForSmallOperationsBCrypt | 10   | 300        |    360.997 ms |  1.6975 ms |  1.5048 ms |
