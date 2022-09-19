use std::io::{self, BufRead};

fn main() {
    let stdin = io::stdin();
    let mut iterator = stdin.lock().lines();
    let split: Vec<i32> = iterator
        .next().unwrap().unwrap()
        .split_whitespace()
        .map(|s| s.parse().unwrap())
        .collect();

    if let [_, w, h] = split[..] {
        let s = w * w + h * h;

        for line in iterator {
            let length = line.unwrap().parse::<i32>().unwrap();

            if length * length <= s {
                println!("DA");
            }
            else {
                println!("NE");
            }
        }
    }
}
