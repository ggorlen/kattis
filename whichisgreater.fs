open System

let line = Console.ReadLine().Split ' '
let a = int64 line.[0]
let b = int64 line.[1]
Console.WriteLine(if a > b then 1 else 0)
