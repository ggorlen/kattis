open System

let line = Console.ReadLine()
let pct = float line
Console.WriteLine(100.0 / pct)
Console.WriteLine(100.0 / (100.0 - pct))
