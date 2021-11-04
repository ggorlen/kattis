package main

import (
    "fmt"
    "math"
)

func main() {
    var n float64
    fmt.Scan(&n)
    fmt.Println(int(math.Pow(math.Pow(2, n) + 1, 2)))
}
