import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/network_list_screen.dart';
import 'package:couldai_user_app/screens/security_check_screen.dart';
import 'package:couldai_user_app/screens/speed_test_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const NetworkListScreen(),
    const SecurityCheckScreen(),
    const SpeedTestScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.wifi),
            label: 'Redes',
          ),
          NavigationDestination(
            icon: Icon(Icons.security),
            label: 'Seguridad',
          ),
          NavigationDestination(
            icon: Icon(Icons.speed),
            label: 'Velocidad',
          ),
        ],
      ),
    );
  }
}
