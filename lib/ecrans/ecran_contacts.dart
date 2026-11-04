import 'package:flutter/material.dart';
import '../modeles/modele_discussion.dart';
import 'ecran_discussion.dart';

/// Écran permettant de sélectionner un contact pour lancer une discussion.
class EcranContacts extends StatelessWidget {
  const EcranContacts({super.key});

  final List<ModeleDiscussion> _listeContactsFictifs = const [
    ModeleDiscussion(
      identifiant: 'c1',
      nomInterlocuteur: 'Alice Dupont',
      dernierMessage: 'Disponible',
      heureDernierMessage: '',
      nombreNonLu: 0,
      urlAvatar: '',
    ),
    ModeleDiscussion(
      identifiant: 'c2',
      nomInterlocuteur: 'Bruno Martin',
      dernierMessage: 'Au travail',
      heureDernierMessage: '',
      nombreNonLu: 0,
      urlAvatar: '',
    ),
    ModeleDiscussion(
      identifiant: 'c3',
      nomInterlocuteur: 'Chantal Bernard',
      dernierMessage: 'Occupée',
      heureDernierMessage: '',
      nombreNonLu: 0,
      urlAvatar: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sélectionner un contact'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: _listeContactsFictifs.length,
        itemBuilder: (contexte, index) {
          final contact = _listeContactsFictifs[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal.shade300,
              child: Text(
                contact.nomInterlocuteur[0],
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(contact.nomInterlocuteur, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(contact.dernierMessage),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => EcranDiscussion(discussion: contact),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
