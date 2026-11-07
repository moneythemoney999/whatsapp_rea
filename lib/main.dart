import 'package:flutter/material.dart';

/// Point d'entrée principal de l'application de messagerie style WhatsApp.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ApplicationMessagerie());
}

class ApplicationMessagerie extends StatelessWidget {
  const ApplicationMessagerie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF075E54),
          primary: const Color(0xFF075E54),
          secondary: const Color(0xFF25D366),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
          foregroundColor: Colors.white,
        ),
      ),
      home: const EcranAccueilWhatsApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
