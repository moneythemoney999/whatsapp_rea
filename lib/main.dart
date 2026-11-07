import 'package:flutter/material.dart';
import 'ecrans/ecran_accueil.dart';

/// Point d'entrée principal de l'application de messagerie.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ApplicationMessagerie());
}

class ApplicationMessagerie extends StatelessWidget {
  const ApplicationMessagerie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messagerie Instantanée',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const EcranAccueil(),
      debugShowCheckedModeBanner: false,
    );
  }
}
