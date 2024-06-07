
BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
AMD EPYC 7R32, 1 CPU, 32 logical and 16 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2

Job=.NET 8.0  Runtime=.NET 8.0  

 Method                              | iterations | hashType   | Mean      | Error    | StdDev   |
------------------------------------ |----------- |----------- |----------:|---------:|---------:|
 **RegularFor**                          | **100000**     | **HMACSHA512** | **624.66 ms** | **1.708 ms** | **1.514 ms** |
 ParallelFor                         | 100000     | HMACSHA512 | 108.15 ms | 1.143 ms | 1.013 ms |
 ParallelOptimizedForSmallOperations | 100000     | HMACSHA512 | 111.37 ms | 1.755 ms | 1.641 ms |
 **RegularFor**                          | **100000**     | **SHA512**     | **252.36 ms** | **1.365 ms** | **1.276 ms** |
 ParallelFor                         | 100000     | SHA512     |  73.45 ms | 0.466 ms | 0.413 ms |
 ParallelOptimizedForSmallOperations | 100000     | SHA512     |  58.91 ms | 0.405 ms | 0.379 ms |
 **RegularFor**                          | **100000**     | **SHA256**     | **227.29 ms** | **0.636 ms** | **0.595 ms** |
 ParallelFor                         | 100000     | SHA256     |  71.91 ms | 0.560 ms | 0.524 ms |
 ParallelOptimizedForSmallOperations | 100000     | SHA256     |  71.96 ms | 0.402 ms | 0.376 ms |
 **RegularFor**                          | **100000**     | **SHA1**       | **224.31 ms** | **0.701 ms** | **0.656 ms** |
 ParallelFor                         | 100000     | SHA1       |  70.48 ms | 0.362 ms | 0.303 ms |
 ParallelOptimizedForSmallOperations | 100000     | SHA1       |  72.40 ms | 0.618 ms | 0.548 ms |
 **RegularFor**                          | **100000**     | **MD5**        | **140.26 ms** | **0.540 ms** | **0.505 ms** |
 ParallelFor                         | 100000     | MD5        |  50.51 ms | 0.182 ms | 0.161 ms |
 ParallelOptimizedForSmallOperations | 100000     | MD5        |  51.49 ms | 0.394 ms | 0.369 ms |
