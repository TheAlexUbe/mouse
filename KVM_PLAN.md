# Flutter + Rust KVM App Plan

## Objective
Build a cross-platform (Linux/Windows) software KVM to share a single mouse and keyboard across machines.

## Architecture
- **UI:** Flutter (Desktop).
- **Core:** Rust, integrated via `flutter_rust_bridge`.
- **Input Capture/Injection:** Rust libraries like `rdev` (capture global hooks) and `enigo` (inject keystrokes/mouse movements).
- **Networking:** TCP for state/keyboard (reliable), UDP for mouse movement (low latency).

## Implementation Steps
1. **Initialize Project:** Create Flutter desktop app.
2. **Setup Rust Bridge:** Integrate `flutter_rust_bridge` and create the Rust library.
3. **Network Protocol:** Define protobuf or binary structs in Rust for `MouseMove`, `KeyPress`, `KeyRelease`, `ScreenEdgeHit`.
4. **Capture (Server):** Implement Rust logic to trap the mouse when it hits a screen edge and forward inputs via network.
5. **Injection (Client):** Implement Rust logic to receive network events and inject them into the local OS using `enigo`.
6. **Flutter UI:** Build simple UI to configure Server/Client mode, IP addresses, and screen layout.

## Verification
- Test mouse capture on Windows/Linux.
- Verify low-latency mouse injection over LAN.
- Ensure modifier keys (Ctrl/Shift/Alt) work cross-platform.
