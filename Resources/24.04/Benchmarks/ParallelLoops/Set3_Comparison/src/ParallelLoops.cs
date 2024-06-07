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
    
    private byte[] _bytesToHash = "Hello World"u8.ToArray();
    
    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void RegularFor(int iterations)
    {
        var res = new byte[iterations][];
        for (int i = 0; i < iterations; i++)
        {
            using SHA512 sha512 = SHA512.Create();
            res[i] = sha512.ComputeHash(_bytesToHash);
        }
    }

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void ParallelFor(int iterations)
    {
        var res = new byte[iterations][];
        Parallel.For(0, iterations, i =>
        {
            using SHA512 sha512 = SHA512.Create();
            res[i] = sha512.ComputeHash(_bytesToHash);
        });
    }

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void ParallelForeach(int iterations)
    {
        var res = new byte[iterations][];
        Parallel.ForEach(Enumerable.Range(0, iterations), i =>
        {
            using SHA512 sha512 = SHA512.Create();
            res[i] = sha512.ComputeHash(_bytesToHash);
        });
    }

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void ParallelOptimizedForSmallOperations(int iterations)
    {
        var res = new byte[iterations][];
        // Partition the workload
        var partitioner = Partitioner.Create(0, iterations);

        // Instead creating a delegate for each item we only create one for each partition.
        Parallel.ForEach(partitioner, (r, _) =>
        {
            for (int i = r.Item1; i < r.Item2; i++)
            {
                using SHA512 sha512 = SHA512.Create();
                res[i] = sha512.ComputeHash(_bytesToHash);
            }
        });
    }
    
#endregion

#region Paramters

    public IEnumerable<object> Operations()
    {
        yield return 5;
        yield return 10;
        yield return 100;
        yield return 1_000;
        yield return 10_000;
        yield return 100_000;
    }

#endregion
}