import 'package:flutter/material.dart';

/// Écran des paramètres de l'application.
class EcranParametres extends StatelessWidget {
  const EcranParametres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Utilisateur Reconstruit'),
            accountEmail: Text('utilisateur@exemple.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('U', style: TextStyle(fontSize: 24.0, color: Colors.teal)),
            ),
            decoration: BoxDecoration(color: Colors.teal),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications et Sons'),
            subtitle: const Text('Gérer les alertes de messages'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Confidentialité'),
            subtitle: const Text('Sécurité et chiffrement'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('À propos'),
            subtitle: const Text('Version 1.0.0+1 (Reconstruction)'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
