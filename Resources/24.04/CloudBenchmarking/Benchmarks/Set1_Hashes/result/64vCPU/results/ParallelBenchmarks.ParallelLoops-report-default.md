
BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
AMD EPYC 7R32, 1 CPU, 64 logical and 32 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2

Job=.NET 8.0  Runtime=.NET 8.0  

 Method                              | iterations | hashType   | Mean      | Error    | StdDev   |
------------------------------------ |----------- |----------- |----------:|---------:|---------:|
 **RegularFor**                          | **100000**     | **HMACSHA512** | **625.26 ms** | **1.826 ms** | **1.619 ms** |
 ParallelFor                         | 100000     | HMACSHA512 |  98.18 ms | 1.910 ms | 2.484 ms |
 ParallelOptimizedForSmallOperations | 100000     | HMACSHA512 | 103.10 ms | 1.286 ms | 1.203 ms |
 **RegularFor**                          | **100000**     | **SHA512**     | **249.93 ms** | **0.786 ms** | **0.656 ms** |
 ParallelFor                         | 100000     | SHA512     |  72.49 ms | 0.286 ms | 0.254 ms |
 ParallelOptimizedForSmallOperations | 100000     | SHA512     |  72.48 ms | 0.378 ms | 0.316 ms |
 **RegularFor**                          | **100000**     | **SHA256**     | **220.87 ms** | **1.022 ms** | **0.956 ms** |
 ParallelFor                         | 100000     | SHA256     |  68.35 ms | 0.459 ms | 0.429 ms |
 ParallelOptimizedForSmallOperations | 100000     | SHA256     |  70.04 ms | 0.354 ms | 0.314 ms |
 **RegularFor**                          | **100000**     | **SHA1**       | **224.94 ms** | **0.804 ms** | **0.712 ms** |
 ParallelFor                         | 100000     | SHA1       |  69.61 ms | 0.380 ms | 0.356 ms |
 ParallelOptimizedForSmallOperations | 100000     | SHA1       |  70.27 ms | 0.254 ms | 0.212 ms |
 **RegularFor**                          | **100000**     | **MD5**        | **142.29 ms** | **0.360 ms** | **0.337 ms** |
 ParallelFor                         | 100000     | MD5        |  53.91 ms | 0.271 ms | 0.254 ms |
 ParallelOptimizedForSmallOperations | 100000     | MD5        |  54.18 ms | 0.414 ms | 0.387 ms |
