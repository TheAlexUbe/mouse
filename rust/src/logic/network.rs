use crate::api::simple::KvmEvent;
use std::net::{TcpListener, TcpStream};
use std::thread;
use bincode::{config, decode_from_std_read, encode_into_std_write};

pub fn start_server(port: u16, receiver: std::sync::mpsc::Receiver<KvmEvent>) {
    let addr = format!("0.0.0.0:{}", port);
    let config = config::standard();
    thread::spawn(move || {
        if let Ok(listener) = TcpListener::bind(&addr) {
            println!("Server listening on {}", addr);
            for stream in listener.incoming() {
                match stream {
                    Ok(mut stream) => {
                        println!("Client connected: {:?}", stream.peer_addr());
                        while let Ok(event) = receiver.recv() {
                            if encode_into_std_write(event, &mut stream, config).is_err() {
                                break;
                            }
                        }
                    }
                    Err(e) => println!("Connection failed: {}", e),
                }
            }
        }
    });
}

pub fn start_client(server_ip: String, port: u16, callback: impl Fn(KvmEvent) + Send + 'static) {
    let addr = format!("{}:{}", server_ip, port);
    let config = config::standard();
    thread::spawn(move || {
        if let Ok(mut stream) = TcpStream::connect(&addr) {
            println!("Connected to server at {}", addr);
            loop {
                match decode_from_std_read::<KvmEvent, _, _>(&mut stream, config) {
                    Ok(event) => callback(event),
                    Err(_) => break,
                }
            }
        } else {
            println!("Failed to connect to {}", addr);
        }
    });
}
