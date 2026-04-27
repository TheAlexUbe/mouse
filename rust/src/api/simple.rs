use serde::{Deserialize, Serialize};
use bincode::{Decode, Encode};

#[derive(Serialize, Deserialize, Decode, Encode, Debug, Clone)]
pub enum KvmEvent {
    MouseMove { x: f64, y: f64 },
    MouseButtonPress { button: u8 },
    MouseButtonRelease { button: u8 },
    KeyPress { key: String },
    KeyRelease { key: String },
    Wheel { delta_x: i64, delta_y: i64 },
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
}

pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}
