import 'package:flutter/material.dart';
import 'package:mouse/src/rust/api/orchestrator.dart';
import 'package:mouse/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Software KVM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const KvmHomePage(),
    );
  }
}

class KvmHomePage extends StatefulWidget {
  const KvmHomePage({super.key});

  @override
  State<KvmHomePage> createState() => _KvmHomePageState();
}

class _KvmHomePageState extends State<KvmHomePage> {
  final TextEditingController _ipController = TextEditingController(text: '127.0.0.1');
  final TextEditingController _portController = TextEditingController(text: '8080');
  bool _isRunning = false;
  String _status = 'Stopped';

  void _startServer() {
    final port = int.tryParse(_portController.text) ?? 8080;
    startKvmServer(port: port);
    setState(() {
      _isRunning = true;
      _status = 'Running as Server (Port: $port)';
    });
  }

  void _startClient() {
    final ip = _ipController.text;
    final port = int.tryParse(_portController.text) ?? 8080;
    startKvmClient(serverIp: ip, port: port);
    setState(() {
      _isRunning = true;
      _status = 'Running as Client (Connecting to $ip:$port)';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Software KVM'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _ipController,
              decoration: const InputDecoration(labelText: 'Server IP'),
            ),
            TextField(
              controller: _portController,
              decoration: const InputDecoration(labelText: 'Port'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : _startServer,
                  child: const Text('Start Server'),
                ),
                ElevatedButton(
                  onPressed: _isRunning ? null : _startClient,
                  child: const Text('Start Client'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Status: $_status'),
          ],
        ),
      ),
    );
  }
}
