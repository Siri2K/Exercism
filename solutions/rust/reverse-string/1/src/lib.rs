pub fn reverse(input: &str) -> String {
    let mut vec:Vec<char> = input.chars().collect();
    let output:String = vec.iter().rev().collect();
    output
}
