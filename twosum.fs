open System

let main() =
   let line = Console.ReadLine().Split ' '
   let sum = line |> Seq.sumBy int
   Console.WriteLine(sum)

main()

