using System;
using System.Linq;
namespace Primality
{
    public class Program
    {
        public static bool IsPrime(int number) => (number > 1) ? Enumerable.Range(2, (int)Math.Sqrt(number) -1).All(x => number % x != 0) : false;

        static void Main(string[] args)
        {
            Console.WriteLine(IsPrime(int.Parse(args.Length > 0 ? args[0]: Console.ReadLine())));
        }
    }
}
