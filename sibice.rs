use std::io::{self, BufRead};

fn main() {
    let stdin = io::stdin();
    let mut iterator = stdin.lock().lines();
    let meta = iterator.next().unwrap().unwrap();
    let split: Vec<&str> = meta.split_whitespace().collect();
    let w = split[1].parse::<i32>().unwrap();
    let h = split[2].parse::<i32>().unwrap();
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
