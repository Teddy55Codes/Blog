using System.Collections.Concurrent;
using System.Security.Cryptography;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Jobs;
using BC = BCrypt.Net.BCrypt;

namespace ParallelBenchmarks;

[SimpleJob(RuntimeMoniker.Net80)]
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
    
#region Paramters

    public IEnumerable<object[]> OperationsBCrypt()
    {
        yield return [4, 300];
        yield return [6, 300];
        yield return [8, 300];
        yield return [10, 300];
    }

#endregion
}