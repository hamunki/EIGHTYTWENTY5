use std::io;
use std::cmp::Ordering;
use rand::Rng;

fn main() {
    println!("GUESS THE NUMBER");

    let secret_number = rand::thread_rng().gen_range(1..=100);

    println!("secret_number: {secret_number}");

    loop {
        println!("INPUT GUESS: ");

        let mut guess = String::new();

        io::stdin().read_line(&mut guess).expect("Failed to read line");

        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Type a number, Idiot");
                continue;
            },
        };

        println!("Your guess was {guess}");

        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too Small."),
            Ordering::Greater => println!("Too Big."),
            Ordering::Equal => { 
                println!("You Win.");
                break
            }
        }
    }
}