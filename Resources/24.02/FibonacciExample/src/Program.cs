public class Program
{ 
    public static void Main(string[] args)
    {
        RunFib();
    }
    
    public static void RunFib()
    {
        for (int i = 3; i < int.MaxValue; i++)
        {
            FibonacciSequence(10);
        }
    }

    public static List<long> FibonacciSequence(int count)
    {
        List<long> fibonacciNumbers = [0, 1];
        for (int i = 2; i < count; i++)
        {
            fibonacciNumbers.Add(fibonacciNumbers[i - 2] + fibonacciNumbers[i - 1]);
        }

        return fibonacciNumbers;
    }
}