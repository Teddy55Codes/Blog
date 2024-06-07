using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Jobs;

namespace Switching;

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
public class PLINQSwitching
{
    [Params(10_000, 100_000, 1_000_000, 10_000_000)]
    public int EnumerableLength;

    [Benchmark]
    public void Switching() => Enumerable.Range(0, EnumerableLength).AsParallel().AsSequential().Select(num => Math.Pow(num, 2)).ToList();
    

    [Benchmark]
    public void NoSwitching() => Enumerable.Range(0, EnumerableLength).Select(num => Math.Pow(num, 2)).ToList();
}