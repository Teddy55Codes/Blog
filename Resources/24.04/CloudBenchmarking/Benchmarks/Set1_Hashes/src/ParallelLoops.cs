using System.Collections.Concurrent;
using System.Security.Cryptography;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Jobs;

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
    private byte[] _bytesToHash = "Hello World"u8.ToArray();

#region Benchmark Entry

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void RegularFor(int iterations, HashType hashType)
    {
        for (int i = 0; i < iterations; i++)
        {
            HashWithHashType(hashType);
        }
    }

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void ParallelFor(int iterations, HashType hashType) => Parallel.For(0, iterations, _ => HashWithHashType(hashType));

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void ParallelOptimizedForSmallOperations(int iterations, HashType hashType)
    {
        // Partition the workload
        var partitioner = Partitioner.Create(0, iterations);

        // Instead creating a delegate for each item we only create one for each partition.
        Parallel.ForEach(partitioner, (range, _) =>
        {
            for (int i = range.Item1; i < range.Item2; i++)
            {
                HashWithHashType(hashType);
            }
        });
    }

#endregion

#region Paramters
    
    public IEnumerable<object[]> Operations()
    {
        var iterations = 100_000;
        foreach (var hashType in Enum.GetValues(typeof(HashType)))
        {
            yield return [iterations, hashType];
        }
    }

#endregion
    
    public byte[] HashWithHashType(HashType hashType) => hashType switch
    {
        HashType.HMACSHA512 => HashHMACSHA512(),
        HashType.SHA512 => HashSHA512(),
        HashType.SHA256 => HashSHA256(),
        HashType.SHA1 => HashSHA1(),
        HashType.MD5 => HashMD5()
    };
    
#region Hashes
    
        
    public byte[] HashHMACSHA512()
    {
        using var hmacsha512 =  new HMACSHA512();
        return hmacsha512.ComputeHash(_bytesToHash);
    }
    
    public byte[] HashSHA512()
    {
        using var sha512 = SHA512.Create();
        return sha512.ComputeHash(_bytesToHash);
    }
    
    public byte[] HashSHA256()
    {
        using var sha256 = SHA256.Create();
        return sha256.ComputeHash(_bytesToHash);
    }
    
    public byte[] HashSHA1()
    {
        using var sha1 = SHA1.Create();
        return sha1.ComputeHash(_bytesToHash);
    }
    
    public byte[] HashMD5()
    {
        using var md5 = MD5.Create();
        return md5.ComputeHash(_bytesToHash);
    }

#endregion    
    
}