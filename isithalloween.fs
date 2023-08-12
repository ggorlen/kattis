open System

let line = Console.ReadLine().Split ' '
let m = line.[0]
let d = int line.[1]
let isHalloween = m = "OCT" && d = 31 || m = "DEC" && d = 25
Console.WriteLine(if isHalloween then "yup" else "nope")
