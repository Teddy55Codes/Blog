using System.Runtime;

class Program
{
    static void Main(string[] args)
    {
        GCSettings.LatencyMode = GCLatencyMode.Batch; // disabling concurrent GC 
        Thread.Sleep(TimeSpan.FromSeconds(5)); // waiting for app and memory analyzer startup
        StackExample();
        Console.WriteLine("The 100k integers have been dropped because the method has returned thus the scope ended.");
        Thread.Sleep(TimeSpan.FromSeconds(3));
        SOHExample();
        WaitAndCollect("The 20k integers on the SOH have now been collected");
        LOHExample();
        WaitAndCollect("The 30k integers on the LOH have now been collected");
        Thread.Sleep(TimeSpan.FromSeconds(2));
        POHExample();
        WaitAndCollect("The 20k integers on the POH have now been collected");
        Thread.Sleep(TimeSpan.FromSeconds(2));
    }
    
    static void StackExample()
    {
        Span<int> stackSpan = stackalloc int[100_000];
        Console.WriteLine("Allocated 100k integers to Stack");
        Thread.Sleep(TimeSpan.FromSeconds(3));
    }

    static void SOHExample()
    {
        var smallArray = new int[20_000];
        Console.WriteLine("Allocated 20k integers to SOH Gen 0");
        WaitAndCollect("The Allocated 20k integers now moved to SOH Gen 1");
        WaitAndCollect("The Allocated 20k integers now moved to SOH Gen 2");
    }
    
    static void LOHExample()
    {
        var largeArray = new int[30_000];
        Console.WriteLine("Allocated 30k integers. An integer is 32 bit/4 byte times 30'000, this is 120KB, which exceeds the 85KB threshold and is therefore allocated on the LOH.");
    }
    
    static void POHExample()
    {
        var pinnedArray = GC.AllocateArray<int>(20_000, true);
        Console.WriteLine("Allocated an pinned array of 20k integers.");
    }
    
    static void WaitAndCollect(string text)
    {
        Thread.Sleep(TimeSpan.FromSeconds(3));
        GC.Collect(GC.MaxGeneration, GCCollectionMode.Aggressive, true);
        Console.WriteLine(text);
    }
}

