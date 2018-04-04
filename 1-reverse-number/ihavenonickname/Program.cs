using System;
using System.Linq;

namespace ihavenonickname
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Input: ");

            var input = Console.ReadLine();

            Console.Write("Output: ");

            if (input.All(x => x >= '0' && x <= '9'))
            {
                input.Reverse().ToList().ForEach(Console.Write);
            }
            else
            {
                Console.Write("Erro");
            }

            Console.WriteLine();
        }
    }
}
