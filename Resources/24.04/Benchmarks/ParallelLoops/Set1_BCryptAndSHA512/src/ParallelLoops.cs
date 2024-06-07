using System.Collections.Concurrent;
using System.Security.Cryptography;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Jobs;
using BC = BCrypt.Net.BCrypt;

namespace ParallelBenchmarks;

[SimpleJob(RuntimeMoniker.Net481)]
[SimpleJob(RuntimeMoniker.Net80)]
[SimpleJob(RuntimeMoniker.NativeAot80)]
[KeepBenchmarkFiles]
[AsciiDocExporter,
 PlainExporter,
 RPlotExporter,
 JsonExporterAttribute.Full,
 MarkdownExporter,
 XmlExporterAttribute.Full]
[JsonExporter(indentJson: true)]
[XmlExporter(indentXml: true)]
public class ParallelLoops
{
#region Benchmark Methods
    
#region Benchmak Methods SHA512
    
    private byte[] _bytesToHash = "Hello World"u8.ToArray();
    
    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void RegularFor(int iterations)
    {
        for (int i = 0; i < iterations; i++)
        {
            using SHA512 sha512 = SHA512.Create();
            sha512.ComputeHash(_bytesToHash);
        }
    }

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void ParallelFor(int iterations) => Parallel.For(0, iterations, _ =>
    {
        using SHA512 sha512 = SHA512.Create();
        sha512.ComputeHash(_bytesToHash);
    });

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void ParallelOptimizedForSmallOperations(int iterations)
    {
        // Partition the workload
        var partitioner = Partitioner.Create(0, iterations);

        // Instead creating a delegate for each item we only create one for each partition.
        Parallel.ForEach(partitioner, (range, _) =>
        {
            for (int i = range.Item1; i < range.Item2; i++)
            {
                using SHA512 sha512 = SHA512.Create();
                sha512.ComputeHash(_bytesToHash);
            }
        });
    }
    
#endregion


#region Benchmark Methods BCrypt
    
    private const string StringToHash = "Hello World";
    
    [Benchmark]
    [ArgumentsSource(nameof(OperationsBCrypt))]
    public void RegularForBCrypt(int cost, int iterations)
    {
        for (int i = 0; i < iterations; i++)
        {
            BC.HashPassword(StringToHash, cost);
        }
    }
    
    [Benchmark]
    [ArgumentsSource(nameof(OperationsBCrypt))]
    public void ParallelForBCrypt(int cost, int iterations) => Parallel.For(0, iterations, _ => BC.HashPassword(StringToHash, cost));
    
    [Benchmark]
    [ArgumentsSource(nameof(OperationsBCrypt))]
    public void ParallelOptimizedForSmallOperationsBCrypt(int cost, int iterations)
    {
        // Partition the workload
        var partitioner = Partitioner.Create(0, iterations);
         // Instead creating a delegate for each item we only create one for each partition.
        Parallel.ForEach(partitioner, (range, _) =>
        {
            for (int i = range.Item1; i < range.Item2; i++)
            {
                BC.HashPassword(StringToHash, cost);
            }
        });
    }

#endregion
    
#endregion

#region Paramters

    public IEnumerable<object[]> Operations()
    {
        // Very Short Operations
        yield return [5];
        yield return [10];
        yield return [100];
        yield return [500];
        yield return [1_000];
        yield return [10_000];
        yield return [100_000];
        yield return [1_000_000]; 
    }

    public IEnumerable<object[]> OperationsBCrypt()
    {
        // Short Operations
        yield return [4, 5];
        yield return [4, 10];
        yield return [4, 100];
        yield return [4, 500];
        yield return [4, 1_000];
        yield return [4, 10_000];

        // Medium Length Operations
        yield return [7, 5];
        yield return [7, 10];
        yield return [7, 100];
        yield return [7, 500];

        // Long Operations
        yield return [10, 5];
        yield return [10, 10];
        yield return [10, 100];
    }

#endregion
}