use crate::api::simple::KvmEvent;

#[cfg(target_os = "linux")]
mod linux_injection {
    use super::*;
    use lazy_static::lazy_static;
    use std::sync::Mutex;
    use uinput::event::controller::Controller;
    use uinput::event::controller::Mouse;
    use uinput::event::relative::Relative::Position;
    use uinput::event::relative::Position::{X, Y};
    use uinput::Device;

    lazy_static! {
        static ref DEVICE: Mutex<Option<Device>> = Mutex::new(init_device());
        static ref LAST_POS: Mutex<(f64, f64)> = Mutex::new((0.0, 0.0));
    }

    fn init_device() -> Option<Device> {
        uinput::default()
            .ok()?
            .name("KVM-Virtual-Device")
            .ok()?
            .event(uinput::event::Keyboard::All)
            .ok()?
            .event(uinput::event::controller::Controller::Mouse(uinput::event::controller::Mouse::Left))
            .ok()?
            .event(uinput::event::controller::Controller::Mouse(uinput::event::controller::Mouse::Middle))
            .ok()?
            .event(uinput::event::controller::Controller::Mouse(uinput::event::controller::Mouse::Right))
            .ok()?
            .event(Position(X))
            .ok()?
            .event(Position(Y))
            .ok()?
            .create()
            .ok()
    }

    pub fn inject_event_linux(event: KvmEvent) {
        let mut device_guard = DEVICE.lock().unwrap();
        if let Some(ref mut device) = *device_guard {
            match event {
                KvmEvent::MouseMove { x, y } => {
                    let mut last_pos = LAST_POS.lock().unwrap();
                    let dx = (x - last_pos.0) as i32;
                    let dy = (y - last_pos.1) as i32;
                    let _ = device.send(X, dx);
                    let _ = device.send(Y, dy);
                    let _ = device.synchronize();
                    *last_pos = (x, y);
                }
                KvmEvent::MouseButtonPress { button } => {
                    if let Some(b) = to_uinput_button(button) {
                        let _ = device.press(&b);
                        let _ = device.synchronize();
                    }
                }
                KvmEvent::MouseButtonRelease { button } => {
                    if let Some(b) = to_uinput_button(button) {
                        let _ = device.release(&b);
                        let _ = device.synchronize();
                    }
                }
                KvmEvent::KeyPress { key } => {
                    if let Some(k) = to_uinput_key(&key) {
                        let _ = device.press(&k);
                        let _ = device.synchronize();
                    }
                }
                KvmEvent::KeyRelease { key } => {
                    if let Some(k) = to_uinput_key(&key) {
                        let _ = device.release(&k);
                        let _ = device.synchronize();
                    }
                }
                KvmEvent::Wheel { delta_x: _, delta_y: _ } => {
                    // Wheel implementation can be added if needed
                }
            }
        }
    }

    fn to_uinput_button(button: u8) -> Option<Controller> {
        match button {
            1 => Some(Controller::Mouse(Mouse::Left)),
            2 => Some(Controller::Mouse(Mouse::Middle)),
            3 => Some(Controller::Mouse(Mouse::Right)),
            _ => None,
        }
    }

    fn to_uinput_key(key: &str) -> Option<uinput::event::keyboard::Key> {
        use uinput::event::keyboard::Key;
        match key {
            "KeyA" => Some(Key::A), "KeyB" => Some(Key::B), "KeyC" => Some(Key::C), "KeyD" => Some(Key::D),
            "KeyE" => Some(Key::E), "KeyF" => Some(Key::F), "KeyG" => Some(Key::G), "KeyH" => Some(Key::H),
            "KeyI" => Some(Key::I), "KeyJ" => Some(Key::J), "KeyK" => Some(Key::K), "KeyL" => Some(Key::L),
            "KeyM" => Some(Key::M), "KeyN" => Some(Key::N), "KeyO" => Some(Key::O), "KeyP" => Some(Key::P),
            "KeyQ" => Some(Key::Q), "KeyR" => Some(Key::R), "KeyS" => Some(Key::S), "KeyT" => Some(Key::T),
            "KeyU" => Some(Key::U), "KeyV" => Some(Key::V), "KeyW" => Some(Key::W), "KeyX" => Some(Key::X),
            "KeyY" => Some(Key::Y), "KeyZ" => Some(Key::Z),
            "Num1" => Some(Key::_1), "Num2" => Some(Key::_2), "Num3" => Some(Key::_3), "Num4" => Some(Key::_4),
            "Num5" => Some(Key::_5), "Num6" => Some(Key::_6), "Num7" => Some(Key::_7), "Num8" => Some(Key::_8),
            "Num9" => Some(Key::_9), "Num0" => Some(Key::_0),
            "Space" => Some(Key::Space), "Return" => Some(Key::Enter), "Escape" => Some(Key::Esc),
            "Backspace" => Some(Key::BackSpace), "Tab" => Some(Key::Tab),
            "ControlLeft" => Some(Key::LeftControl), "ControlRight" => Some(Key::RightControl),
            "ShiftLeft" => Some(Key::LeftShift), "ShiftRight" => Some(Key::RightShift),
            "Alt" => Some(Key::LeftAlt), "AltGr" => Some(Key::RightAlt),
            "MetaLeft" => Some(Key::LeftMeta), "MetaRight" => Some(Key::RightMeta),
            "LeftArrow" => Some(Key::Left), "RightArrow" => Some(Key::Right),
            "UpArrow" => Some(Key::Up), "DownArrow" => Some(Key::Down),
            _ => None,
        }
    }
}

pub fn inject_event(event: KvmEvent) {
    #[cfg(target_os = "linux")]
    {
        linux_injection::inject_event_linux(event);
    }

    #[cfg(not(target_os = "linux"))]
    {
        use rdev::{simulate, Button, EventType, Key};
        let event_type = match event {
            KvmEvent::MouseMove { x, y } => Some(EventType::MouseMove { x, y }),
            KvmEvent::MouseButtonPress { button } => Some(EventType::ButtonPress(to_rdev_button(button))),
            KvmEvent::MouseButtonRelease { button } => Some(EventType::ButtonRelease(to_rdev_button(button))),
            KvmEvent::KeyPress { key } => to_rdev_key(&key).map(EventType::KeyPress),
            KvmEvent::KeyRelease { key } => to_rdev_key(&key).map(EventType::KeyRelease),
            KvmEvent::Wheel { delta_x, delta_y } => Some(EventType::Wheel { delta_x, delta_y }),
        };

        if let Some(et) = event_type {
            let _ = simulate(&et);
        }
    }
}

#[cfg(not(target_os = "linux"))]
fn to_rdev_button(button: u8) -> rdev::Button {
    match button {
        1 => rdev::Button::Left,
        2 => rdev::Button::Middle,
        3 => rdev::Button::Right,
        b => rdev::Button::Unknown(b),
    }
}

#[cfg(not(target_os = "linux"))]
fn to_rdev_key(key: &str) -> Option<rdev::Key> {
    use rdev::Key;
    match key {
        "Alt" => Some(Key::Alt),
        "AltGr" => Some(Key::AltGr),
        "Backspace" => Some(Key::Backspace),
        "CapsLock" => Some(Key::CapsLock),
        "ControlLeft" => Some(Key::ControlLeft),
        "ControlRight" => Some(Key::ControlRight),
        "Delete" => Some(Key::Delete),
        "DownArrow" => Some(Key::DownArrow),
        "End" => Some(Key::End),
        "Escape" => Some(Key::Escape),
        "F1" => Some(Key::F1),
        "F2" => Some(Key::F2),
        "F3" => Some(Key::F3),
        "F4" => Some(Key::F4),
        "F5" => Some(Key::F5),
        "F6" => Some(Key::F6),
        "F7" => Some(Key::F7),
        "F8" => Some(Key::F8),
        "F9" => Some(Key::F9),
        "F10" => Some(Key::F10),
        "F11" => Some(Key::F11),
        "F12" => Some(Key::F12),
        "Home" => Some(Key::Home),
        "LeftArrow" => Some(Key::LeftArrow),
        "MetaLeft" => Some(Key::MetaLeft),
        "MetaRight" => Some(Key::MetaRight),
        "PageDown" => Some(Key::PageDown),
        "PageUp" => Some(Key::PageUp),
        "Return" => Some(Key::Return),
        "RightArrow" => Some(Key::RightArrow),
        "ShiftLeft" => Some(Key::ShiftLeft),
        "ShiftRight" => Some(Key::ShiftRight),
        "Space" => Some(Key::Space),
        "Tab" => Some(Key::Tab),
        "UpArrow" => Some(Key::UpArrow),
        "PrintScreen" => Some(Key::PrintScreen),
        "ScrollLock" => Some(Key::ScrollLock),
        "Pause" => Some(Key::Pause),
        "NumLock" => Some(Key::NumLock),
        "BackQuote" => Some(Key::BackQuote),
        "Num1" => Some(Key::Num1),
        "Num2" => Some(Key::Num2),
        "Num3" => Some(Key::Num3),
        "Num4" => Some(Key::Num4),
        "Num5" => Some(Key::Num5),
        "Num6" => Some(Key::Num6),
        "Num7" => Some(Key::Num7),
        "Num8" => Some(Key::Num8),
        "Num9" => Some(Key::Num9),
        "Num0" => Some(Key::Num0),
        "Minus" => Some(Key::Minus),
        "Equal" => Some(Key::Equal),
        "KeyQ" => Some(Key::KeyQ),
        "KeyW" => Some(Key::KeyW),
        "KeyE" => Some(Key::KeyE),
        "KeyR" => Some(Key::KeyR),
        "KeyT" => Some(Key::KeyT),
        "KeyY" => Some(Key::KeyY),
        "KeyU" => Some(Key::KeyU),
        "KeyI" => Some(Key::KeyI),
        "KeyO" => Some(Key::KeyO),
        "KeyP" => Some(Key::KeyP),
        "LeftBracket" => Some(Key::LeftBracket),
        "RightBracket" => Some(Key::RightBracket),
        "BackSlash" => Some(Key::BackSlash),
        "KeyA" => Some(Key::KeyA),
        "KeyS" => Some(Key::KeyS),
        "KeyD" => Some(Key::KeyD),
        "KeyF" => Some(Key::KeyF),
        "KeyG" => Some(Key::KeyG),
        "KeyH" => Some(Key::KeyH),
        "KeyJ" => Some(Key::KeyJ),
        "KeyK" => Some(Key::KeyK),
        "KeyL" => Some(Key::KeyL),
        "SemiColon" => Some(Key::SemiColon),
        "Quote" => Some(Key::Quote),
        "KeyZ" => Some(Key::KeyZ),
        "KeyX" => Some(Key::KeyX),
        "KeyC" => Some(Key::KeyC),
        "KeyV" => Some(Key::KeyV),
        "KeyB" => Some(Key::KeyB),
        "KeyN" => Some(Key::KeyN),
        "KeyM" => Some(Key::KeyM),
        "Comma" => Some(Key::Comma),
        "Dot" => Some(Key::Dot),
        "Slash" => Some(Key::Slash),
        "Insert" => Some(Key::Insert),
        "KpReturn" => Some(Key::KpReturn),
        "KpMinus" => Some(Key::KpMinus),
        "KpPlus" => Some(Key::KpPlus),
        "KpMultiply" => Some(Key::KpMultiply),
        "KpDivide" => Some(Key::KpDivide),
        "Kp0" => Some(Key::Kp0),
        "Kp1" => Some(Key::Kp1),
        "Kp2" => Some(Key::Kp2),
        "Kp3" => Some(Key::Kp3),
        "Kp4" => Some(Key::Kp4),
        "Kp5" => Some(Key::Kp5),
        "Kp6" => Some(Key::Kp6),
        "Kp7" => Some(Key::Kp7),
        "Kp8" => Some(Key::Kp8),
        "Kp9" => Some(Key::Kp9),
        _ => None,
    }
}
