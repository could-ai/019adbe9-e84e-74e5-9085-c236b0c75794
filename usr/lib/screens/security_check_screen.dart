import 'package:flutter/material.dart';

class SecurityCheckScreen extends StatelessWidget {
  const SecurityCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Análisis de Seguridad')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSecurityCard(
              context,
              title: 'Estado de la Red Actual',
              status: 'Segura (WPA2)',
              icon: Icons.shield,
              color: Colors.green,
              details: 'Tu conexión está cifrada y protegida contra intrusos básicos.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Recomendaciones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildRecommendationItem(
              'Usa contraseñas fuertes',
              'Combina letras, números y símbolos.',
            ),
            _buildRecommendationItem(
              'Evita redes abiertas',
              'Las redes públicas sin contraseña son vulnerables.',
            ),
            _buildRecommendationItem(
              'Actualiza tu router',
              'Mantén el firmware de tu router actualizado.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityCard(BuildContext context, {
    required String title,
    required String status,
    required IconData icon,
    required Color color,
    required String details,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 64, color: color),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          Text(
            status,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
          ),
          const SizedBox(height: 16),
          Text(
            details,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.check_circle_outline, color: Colors.blueAccent),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }
}
