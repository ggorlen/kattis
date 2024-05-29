use std::io::{self, BufRead};

fn main() {
    let stdin = io::stdin();
    let mut iterator = stdin.lock().lines();
    let n = iterator
        .next()
        .unwrap()
        .unwrap()
        .parse::<i32>()
        .unwrap();

    if n == 2 {
        println!("blandad best");
        return;
    }

    let s = iterator
        .next()
        .unwrap()
        .unwrap();
    println!("{}", s);
}
