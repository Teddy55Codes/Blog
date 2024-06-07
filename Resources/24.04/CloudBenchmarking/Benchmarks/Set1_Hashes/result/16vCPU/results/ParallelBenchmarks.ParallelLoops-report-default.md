
BenchmarkDotNet v0.13.12, Debian GNU/Linux 12 (bookworm) (container)
AMD EPYC 7R32, 1 CPU, 16 logical and 8 physical cores
.NET SDK 8.0.300
  [Host]   : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2
  .NET 8.0 : .NET 8.0.5 (8.0.524.21615), X64 RyuJIT AVX2

Job=.NET 8.0  Runtime=.NET 8.0  

 Method                              | iterations | hashType   | Mean      | Error    | StdDev   |
------------------------------------ |----------- |----------- |----------:|---------:|---------:|
 **RegularFor**                          | **100000**     | **HMACSHA512** | **624.06 ms** | **0.828 ms** | **0.774 ms** |
 ParallelFor                         | 100000     | HMACSHA512 | 120.90 ms | 0.964 ms | 0.902 ms |
 ParallelOptimizedForSmallOperations | 100000     | HMACSHA512 | 126.57 ms | 2.409 ms | 2.254 ms |
 **RegularFor**                          | **100000**     | **SHA512**     | **251.78 ms** | **0.785 ms** | **0.734 ms** |
 ParallelFor                         | 100000     | SHA512     |  71.64 ms | 0.163 ms | 0.145 ms |
 ParallelOptimizedForSmallOperations | 100000     | SHA512     |  72.50 ms | 0.536 ms | 0.501 ms |
 **RegularFor**                          | **100000**     | **SHA256**     | **229.36 ms** | **0.713 ms** | **0.667 ms** |
 ParallelFor                         | 100000     | SHA256     |  70.57 ms | 0.311 ms | 0.291 ms |
 ParallelOptimizedForSmallOperations | 100000     | SHA256     |  72.28 ms | 0.553 ms | 0.517 ms |
 **RegularFor**                          | **100000**     | **SHA1**       | **226.21 ms** | **0.641 ms** | **0.599 ms** |
 ParallelFor                         | 100000     | SHA1       |  70.23 ms | 0.180 ms | 0.169 ms |
 ParallelOptimizedForSmallOperations | 100000     | SHA1       |  71.82 ms | 0.325 ms | 0.304 ms |
 **RegularFor**                          | **100000**     | **MD5**        | **141.40 ms** | **0.415 ms** | **0.388 ms** |
 ParallelFor                         | 100000     | MD5        |  37.60 ms | 0.177 ms | 0.165 ms |
 ParallelOptimizedForSmallOperations | 100000     | MD5        |  39.32 ms | 0.157 ms | 0.147 ms |
