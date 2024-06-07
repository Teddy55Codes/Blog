using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Jobs;

namespace PLINQBenchmarks;

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
public class PLINQBenchmarks
{
    
#region Benchmarks

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void WithLINQ(int iterations) => Enumerable.Range(0, iterations).Where(IsPrime).ToList();
    
    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void WithPLINQ(int iterations) => Enumerable.Range(0, iterations).AsParallel().Where(IsPrime).ToList();
    
    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void WithOrderedPLINQ(int iterations) => Enumerable.Range(0, iterations).AsParallel().AsOrdered().Where(IsPrime).ToList();

#endregion
    
    public bool IsPrime(int number) 
    {
        switch (number)
        {
            case <= 1:
                return false;
            case 2:
                return true;
            default:
                var boundary = (int)Math.Floor(Math.Sqrt(number));
                for (int i = 2; i <= boundary; i++)
                {
                    if (number % i == 0) return false;
                }
                return true;
        }
    }
    
#region Paramters
    
    public IEnumerable<object> Operations()
    {
        yield return 1_000;
        yield return 10_000;
        yield return 100_000;
        yield return 1_000_000;
    }

#endregion
    
}