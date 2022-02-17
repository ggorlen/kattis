using System;

class Pyramids
{
    static void Main()
    {
        int blocks = int.Parse(Console.ReadLine());
        int levels = 0;
        int taken = 0;

        for (int i = 1;; i += 2)
        {
            int nextLevel = i * i;
            
            if (taken + nextLevel > blocks) break;

            taken += nextLevel;
            levels++;
        }

        Console.WriteLine(levels);
    }
}
