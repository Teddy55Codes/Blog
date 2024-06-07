using System.Collections.Concurrent;
using System.Security.Cryptography;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Jobs;

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
    private byte[][] _dataToHash = Enumerable.Repeat(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."u8.ToArray(), 
        100_000).ToArray();

#region Benchmark Entry

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void RegularFor(HashType hashType)
    {
        var hashedResult = new byte[_dataToHash.Length][];
        for (int i = 0; i < _dataToHash.Length; i++)
        {
            hashedResult[i] = HashWithHashType(_dataToHash[i], hashType);
        }
    }

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void ParallelFor(HashType hashType)
    {
        var hashedResult = new byte[_dataToHash.Length][];
        Parallel.For(0, _dataToHash.Length, i => hashedResult[i] = HashWithHashType(_dataToHash[i], hashType));
    }

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void ParallelOptimizedForSmallOperations(HashType hashType)
    {
        var hashedResult = new byte[_dataToHash.Length][];
        
        // Partition the workload
        var partitioner = Partitioner.Create(0, _dataToHash.Length);

        // Instead creating a delegate for each item we only create one for each partition.
        Parallel.ForEach(partitioner, (range, _) =>
        {
            for (int i = range.Item1; i < range.Item2; i++)
            {
                hashedResult[i] = HashWithHashType(_dataToHash[i], hashType);
            }
        });
    }

#endregion

#region Paramters
    
    public IEnumerable<object> Operations()
    {
        foreach (var hashType in Enum.GetValues(typeof(HashType)))
        {
            yield return hashType;
        }
    }

#endregion
    
    public byte[] HashWithHashType(byte[] dataToHash, HashType hashType) => hashType switch
    {
        HashType.HMACSHA512 => HashHMACSHA512(dataToHash),
        HashType.SHA512 => HashSHA512(dataToHash),
        HashType.SHA256 => HashSHA256(dataToHash),
        HashType.SHA1 => HashSHA1(dataToHash),
        HashType.MD5 => HashMD5(dataToHash)
    };
    
#region Hashes
    
    public byte[] HashHMACSHA512(byte[] dataToHash)
    {
        using var hmacsha512 = new HMACSHA512();
        return hmacsha512.ComputeHash(dataToHash);
    }
    
    public byte[] HashSHA512(byte[] dataToHash)
    {
        using var sha512 = SHA512.Create();
        return sha512.ComputeHash(dataToHash);
    }
    
    public byte[] HashSHA256(byte[] dataToHash)
    {
        using var sha256 = SHA256.Create();
        return sha256.ComputeHash(dataToHash);
    }
    
    public byte[] HashSHA1(byte[] dataToHash)
    {
        using var sha1 = SHA1.Create();
        return sha1.ComputeHash(dataToHash);
    }
    
    public byte[] HashMD5(byte[] dataToHash)
    {
        using var md5 = MD5.Create();
        return md5.ComputeHash(dataToHash);
    }

#endregion    
    
}