import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';


class Suciedapp extends StatelessWidget {
  const Suciedapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suciedapp',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
