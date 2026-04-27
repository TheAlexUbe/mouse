use crate::api::simple::KvmEvent;
use crate::logic::capture::start_capture;
use crate::logic::injection::inject_event;
use crate::logic::network::{start_client, start_server};
use std::sync::mpsc::channel;

pub fn start_kvm_server(port: u16) {
    let (tx, rx) = channel::<KvmEvent>();
    start_capture(tx);
    start_server(port, rx);
}

pub fn start_kvm_client(server_ip: String, port: u16) {
    start_client(server_ip, port, |event| {
        inject_event(event);
    });
}
