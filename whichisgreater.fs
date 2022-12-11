open System

let line = Console.ReadLine().Split ' '
Console.WriteLine(if line.[0] > line.[1] then 1 else 0)
