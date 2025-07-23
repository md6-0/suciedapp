import 'package:flutter/material.dart';
import 'city_selector_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _goToCitySelector(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const CitySelectorScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfaf9f3),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const SizedBox(height: 100),

              const Text(
                "Empieza a usar Suciedapp",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  height: 1.1,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF10182b),
                ),
              ),

              const SizedBox(height: 36),

              const Text(
                "Ayúdanos a mantener tu ciudad limpia. Exijamos responsabilidades a las administraciones públicas.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF3b4d63)
                ),
              ),

              const SizedBox(height: 48),

              Image.asset(
                'assets/welcome.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
              ),

              const SizedBox(height: 64),
          
              ElevatedButton(
                onPressed: () => _goToCitySelector(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 128, vertical: 16),
                  backgroundColor: Color(0xFF00af75),
                ),
                child: const Text(
                  "Empezar",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
