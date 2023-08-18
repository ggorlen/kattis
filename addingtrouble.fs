open System

let ints = Console.ReadLine().Split ' ' |> Array.map(int)
Console.WriteLine(if ints.[0] + ints.[1] = ints.[2] then "correct!" else "wrong!")
