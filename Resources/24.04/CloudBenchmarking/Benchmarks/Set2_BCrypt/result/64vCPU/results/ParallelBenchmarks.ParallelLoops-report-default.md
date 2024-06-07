
BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
AMD EPYC 7R32, 1 CPU, 64 logical and 32 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2

Job=.NET 8.0  Runtime=.NET 8.0  

 Method                                    | cost | iterations | Mean          | Error      | StdDev     |
------------------------------------------ |----- |----------- |--------------:|-----------:|-----------:|
 **RegularForBCrypt**                          | **4**    | **300**        |    **386.077 ms** |  **1.4262 ms** |  **1.3341 ms** |
 ParallelForBCrypt                         | 4    | 300        |     12.579 ms |  0.0500 ms |  0.0443 ms |
 ParallelOptimizedForSmallOperationsBCrypt | 4    | 300        |      9.272 ms |  0.0624 ms |  0.0583 ms |
 **RegularForBCrypt**                          | **6**    | **300**        |  **1,479.718 ms** |  **8.3493 ms** |  **7.8099 ms** |
 ParallelForBCrypt                         | 6    | 300        |     44.960 ms |  0.6720 ms |  0.6286 ms |
 ParallelOptimizedForSmallOperationsBCrypt | 6    | 300        |     31.881 ms |  0.4802 ms |  0.4257 ms |
 **RegularForBCrypt**                          | **8**    | **300**        |  **5,866.950 ms** | **13.9014 ms** | **13.0034 ms** |
 ParallelForBCrypt                         | 8    | 300        |    173.524 ms |  1.7992 ms |  1.6830 ms |
 ParallelOptimizedForSmallOperationsBCrypt | 8    | 300        |    119.266 ms |  1.0565 ms |  0.9882 ms |
 **RegularForBCrypt**                          | **10**   | **300**        | **23,353.418 ms** | **68.9948 ms** | **64.5377 ms** |
 ParallelForBCrypt                         | 10   | 300        |    682.387 ms |  3.0421 ms |  2.8456 ms |
 ParallelOptimizedForSmallOperationsBCrypt | 10   | 300        |    466.278 ms |  0.4057 ms |  0.3596 ms |
