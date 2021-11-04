using System;
using System.Collections.Generic;

namespace PhoneList
{
    class Program
    {
        static bool IsConsistent(List<string> numbers)
        {
            numbers.Sort((a, b) => a.Length - b.Length);
            var prefixes = new HashSet<string>();

            foreach (var n in numbers)
            {
                for (int i = 1; i < n.Length; i++)
                {
                    if (prefixes.Contains(n.Substring(0, i)))
                    {
                        return false;
                    }
                }

                prefixes.Add(n);
            }

            return true;
        }

        static void Main(string[] args)
        {
            int testCases = Int32.Parse(Console.ReadLine());

            for (int i = 0; i < testCases; i++)
            {
                int phoneNumbersCount = Int32.Parse(Console.ReadLine());
                var numbers = new List<string>();

                for (int j = 0; j < phoneNumbersCount; j++)
                {
                    numbers.Add(Console.ReadLine());
                }

                Console.WriteLine(IsConsistent(numbers) ? "YES" : "NO");
            }
        }
    }
}
