import 'package:flutter/material.dart';

class NetworkListScreen extends StatelessWidget {
  const NetworkListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for available networks
    final List<Map<String, dynamic>> networks = [
      {'ssid': 'MiCasa_5G', 'signal': 95, 'secure': true, 'connected': true},
      {'ssid': 'Vecino_WiFi', 'signal': 70, 'secure': true, 'connected': false},
      {'ssid': 'Cafeteria_Free', 'signal': 45, 'secure': false, 'connected': false},
      {'ssid': 'Oficina_Guest', 'signal': 30, 'secure': true, 'connected': false},
      {'ssid': 'WiFi_Publico', 'signal': 85, 'secure': false, 'connected': false},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Escáner de Redes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: networks.length,
        itemBuilder: (context, index) {
          final net = networks[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: net['connected'] ? Theme.of(context).colorScheme.primaryContainer : null,
            child: ListTile(
              leading: Icon(
                net['secure'] ? Icons.wifi_lock : Icons.wifi,
                color: net['secure'] ? Colors.greenAccent : Colors.orangeAccent,
              ),
              title: Text(
                net['ssid'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(net['connected'] ? 'Conectado' : 'Disponible - Señal: ${net['signal']}%'),
              trailing: net['connected'] 
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Analizando red: ${net['ssid']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
