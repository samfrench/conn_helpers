use cookie::Cookie;
use std::collections::HashMap;

#[rustler::nif]
fn cookie_decode(value: &str) -> HashMap<&str, &str> {
    let mut cookies = HashMap::new();

    for cookie in Cookie::split_parse(value) {
        match cookie {
            Ok(c) => {
                cookies.insert(c.name_raw().unwrap(), c.value_raw().unwrap());
            },
            _ => continue,
        };
    }

    cookies
}

rustler::init!("Elixir.ConnHelpers", [cookie_decode]);
