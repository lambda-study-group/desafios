using System;
using System.Linq;
namespace reverse
{
    public class Program
    {
        public static string Revert(string reverse)
        {
            if(reverse.Any(x => !char.IsDigit(x))) 
                return "Erro"; 
            return string.Join("",reverse.Reverse().ToList());
        }
        static void Main(string[] args)
        {
            Console.WriteLine(Revert(args.Length > 0 ? args[0] : Console.ReadLine())) ;
        }
    }
}
