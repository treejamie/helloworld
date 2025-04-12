use std::env;
use std::collections::HashMap;
use once_cell::sync::Lazy;
use rand:: rng;

// Hashmap of the values of Hello, World!
static GREETING: Lazy<HashMap<&str, &str>> = Lazy::new(|| {
    HashMap::from([
        ("en", "Hello, world!"),
        ("el", "Γειά σου, κόσμε!"),
        ("gd", "Halò, a shaoghail!"),
        ("mk", "Здраво, свету!"),
        ("he", "שלום, עולם!"),
        ("fr", "Bonjour, le monde!"),
    ])
})

fn main() {
    let args: Vec<String> = env::args().skip(1).collect();

    greet(args.unwrap());
}

/*  If no language is given as argument,
    a random language is taken from key list
    and shown the greetings for that language
*/
fn greet(mut lang: String) -> none {
    let mut code = &lang;
    
    if lang.is_empty() {
        code = get_random_key();
    }

    println!("{}", GREETING.get(code))
}

fn get_random_key() -> String {
    let keys: Vec<_> = GREETING.keys().copied().collect();
    let mut rng = rng();
    keys.choose(&mut rng).copied();
}