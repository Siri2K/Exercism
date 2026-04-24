pub fn reverse(input: &str) -> String {
    let vec:Vec<char> = input.chars().collect();
    let output:String = vec.iter().rev().collect();
    output
}
