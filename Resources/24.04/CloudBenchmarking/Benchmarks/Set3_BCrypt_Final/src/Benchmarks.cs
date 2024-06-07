using System.Collections.Concurrent;
using System.Security.Cryptography;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Jobs;
using BC = BCrypt.Net.BCrypt;

namespace TPLBenchmarks;

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
public class Benchmarks
{
    
#region Benchmark Methods BCrypt
    
    private string[] _stringsToHash = Enumerable.Repeat(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
        300).ToArray();

    [Benchmark]
    [ArgumentsSource(nameof(OperationsBCrypt))]
    public void BCryptWithLINQ(int cost) => _stringsToHash.Select(str => BC.HashPassword(str, cost)).ToList();

    [Benchmark]
    [ArgumentsSource(nameof(OperationsBCrypt))]
    public void BCryptWithPLINQ(int cost) => _stringsToHash.AsParallel().Select(str => BC.HashPassword(str, cost)).ToList();

    [Benchmark]
    [ArgumentsSource(nameof(OperationsBCrypt))]
    public void BCryptWithOrderedPLINQ(int cost) => _stringsToHash.AsParallel().AsOrdered().Select(str => BC.HashPassword(str, cost)).ToList();
    
    [Benchmark]
    [ArgumentsSource(nameof(OperationsBCrypt))]
    public void BCryptWithRegularFor(int cost)
    {
        var hashedResult = new string[_stringsToHash.Length];
        for (int i = 0; i < _stringsToHash.Length; i++)
        {
            hashedResult[i] =  BC.HashPassword(_stringsToHash[i], cost);
        }
    }
    
    [Benchmark]
    [ArgumentsSource(nameof(OperationsBCrypt))]
    public void BCryptWithRegularForEach(int cost)
    {
        var hashedResult = new List<string>(_stringsToHash.Length);
        foreach (var str in _stringsToHash)
        {
            hashedResult.Add(BC.HashPassword(str, cost));
        }
    }
    
    [Benchmark]
    [ArgumentsSource(nameof(OperationsBCrypt))]
    public void BCryptWithParallelFor(int cost)
    {
        var hashedResult = new string[_stringsToHash.Length];
        Parallel.For(0, _stringsToHash.Length, i => hashedResult[i] = BC.HashPassword(_stringsToHash[i], cost));
    }
    
    [Benchmark]
    [ArgumentsSource(nameof(OperationsBCrypt))]
    public void BCryptWithParallelForEach(int cost)
    {
        var hashedResult = new List<string>(_stringsToHash.Length);
        Parallel.ForEach(_stringsToHash, str => hashedResult.Add(BC.HashPassword(str, cost)));
    }


    [Benchmark]
    [ArgumentsSource(nameof(OperationsBCrypt))]
    public void BCryptParallelOptimizedForSmallOperations(int cost)
    {
        var hashedResult = new string[_stringsToHash.Length];
        // Partition the workload
        var partitioner = Partitioner.Create(0, _stringsToHash.Length);
        
        // Instead creating a delegate for each item we only create one for each partition.
        Parallel.ForEach(partitioner, (range, _) =>
        {
            for (int i = range.Item1; i < range.Item2; i++)
            {
                hashedResult[i] = BC.HashPassword(_stringsToHash[i], cost);
            }
        });
    }

#endregion
    
#region Paramters

    public IEnumerable<object> OperationsBCrypt()
    {
        yield return 4;
        yield return 6;
        yield return 8;
        yield return 10;
    }

#endregion
}