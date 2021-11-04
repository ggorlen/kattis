package main

import (
    "fmt"
)

func main() {
    var tests int
    fmt.Scan(&tests)
    lastFacts := []int{1, 1, 2, 6, 4}

    for i := 0; i < tests; i++ {
        var n int
        fmt.Scan(&n)

        if n < len(lastFacts) {
            fmt.Println(lastFacts[n])
        } else {
            fmt.Println(0)
        }
    }
}
