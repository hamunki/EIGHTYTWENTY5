fn main() {
    const SECONDS_IN_A_DAY: u32 = 24*60*60;
    let mut x = 5;
    println!("x = {x}");
    x = 6;
    println!("x = {x}");
    println!("SECONDS_IN_A_DAY: {SECONDS_IN_A_DAY}");
    println!("==================================");

    let incremental = 1;
    println!("incremental: {incremental}");
    {
        let incremental = incremental + 2;
        println!("incremental: {incremental}");
    }
    println!("incremental: {incremental}");


    println!("==================================");

    let tup = (500, 6.4, true, "Sausage", 'A');
    println!("3: {}", tup.3);


    println!("==================================");

    for i in 0..25 {
        
        // println!("{}", i);
    }

}
