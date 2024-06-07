using System.Security.Cryptography;
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
    private byte[][] _dataToHash = Enumerable.Repeat(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."u8.ToArray(), 
        100_000).ToArray();

#region Benchmark Entry

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void WithLINQ(HashType hashType) => _dataToHash.Select(bytes => HashWithHashType(bytes, hashType)).ToList();

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void WithPLINQ(HashType hashType) => _dataToHash.AsParallel().Select(bytes => HashWithHashType(bytes, hashType)).ToList();

    [Benchmark]
    [ArgumentsSource(nameof(Operations))]
    public void WithOrderedPLINQ(HashType hashType) => _dataToHash.AsParallel().AsOrdered().Select(bytes => HashWithHashType(bytes, hashType)).ToList();

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