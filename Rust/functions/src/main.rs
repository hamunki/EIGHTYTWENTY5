fn main() {
    println!("\n\n");
    let mut i_num = 106;
    println!("Calling numbers with {i_num}");
    numbers(i_num);
    i_num = 568;
    println!("Calling numbers with {i_num}");
    numbers(i_num);
}

fn numbers(x: i32) {

    print!("x = 5 = {}\n\n", x + 5);

}
