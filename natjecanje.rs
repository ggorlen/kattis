use std::io::{self, BufRead};

fn main() {
    let stdin = io::stdin();
    let mut iterator = stdin.lock().lines();
    let _ = iterator
        .next().unwrap().unwrap()
        .split_whitespace().next().unwrap()
        .parse::<i32>();

    let damaged = iterator
        .next().unwrap().unwrap()
        .split_whitespace()
        .map(|s| s.parse().unwrap())
        .collect::<Vec<i32>>();
    let mut damaged_originally = damaged.len();

    let mut reserve = iterator
        .next().unwrap().unwrap()
        .split_whitespace()
        .map(|s| s.parse().unwrap())
        .collect::<Vec<i32>>();

    for d in damaged {
        for (i, r) in reserve.iter().enumerate() {
            if d == *r || d - *r == 1 || *r - d == 1 {
                reserve.remove(i);
                damaged_originally -= 1;
                break;
            }
        }
    }

    println!("{}", damaged_originally);
}
