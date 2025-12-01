import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class SpeedTestScreen extends StatefulWidget {
  const SpeedTestScreen({super.key});

  @override
  State<SpeedTestScreen> createState() => _SpeedTestScreenState();
}

class _SpeedTestScreenState extends State<SpeedTestScreen> {
  bool _isTesting = false;
  double _speed = 0.0;
  double _progress = 0.0;
  String _status = 'Listo para iniciar';

  void _startTest() {
    setState(() {
      _isTesting = true;
      _speed = 0.0;
      _progress = 0.0;
      _status = 'Conectando servidor...';
    });

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _progress += 0.02;
        if (_progress < 0.5) {
          _status = 'Probando descarga...';
          _speed = Random().nextDouble() * 50 + 20; // Mock speed 20-70 Mbps
        } else {
          _status = 'Probando subida...';
          _speed = Random().nextDouble() * 20 + 5; // Mock speed 5-25 Mbps
        }

        if (_progress >= 1.0) {
          timer.cancel();
          _isTesting = false;
          _status = 'Prueba completada';
          _speed = 45.2; // Final result
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test de Velocidad')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: _isTesting ? _progress : 0,
                    strokeWidth: 20,
                    backgroundColor: Colors.grey[800],
                    color: Colors.cyanAccent,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _speed.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Mbps',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Text(
              _status,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: _isTesting ? null : _startTest,
              icon: const Icon(Icons.play_arrow),
              label: const Text('INICIAR TEST'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Colors.cyanAccent,
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
