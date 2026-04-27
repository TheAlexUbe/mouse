use crate::api::simple::KvmEvent;
use rdev::{listen, EventType};
use std::thread;

pub fn start_capture(sender: std::sync::mpsc::Sender<KvmEvent>) {
    thread::spawn(move || {
        if let Err(error) = listen(move |event| {
            let kvm_event = match event.event_type {
                EventType::MouseMove { x, y } => Some(KvmEvent::MouseMove { x, y }),
                EventType::ButtonPress(button) => Some(KvmEvent::MouseButtonPress {
                    button: to_u8_button(button),
                }),
                EventType::ButtonRelease(button) => Some(KvmEvent::MouseButtonRelease {
                    button: to_u8_button(button),
                }),
                EventType::KeyPress(key) => Some(KvmEvent::KeyPress {
                    key: format!("{:?}", key),
                }),
                EventType::KeyRelease(key) => Some(KvmEvent::KeyRelease {
                    key: format!("{:?}", key),
                }),
                EventType::Wheel { delta_x, delta_y } => Some(KvmEvent::Wheel { delta_x, delta_y }),
            };

            if let Some(e) = kvm_event {
                let _ = sender.send(e);
            }
        }) {
            println!("Error: {:?}", error);
        }
    });
}

fn to_u8_button(button: rdev::Button) -> u8 {
    match button {
        rdev::Button::Left => 1,
        rdev::Button::Middle => 2,
        rdev::Button::Right => 3,
        rdev::Button::Unknown(b) => b,
    }
}
