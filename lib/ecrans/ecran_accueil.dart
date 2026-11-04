import 'package:flutter/material.dart';
import '../modeles/modele_discussion.dart';
import 'ecran_discussion.dart';
import 'ecran_contacts.dart';
import 'ecran_parametres.dart';

/// Écran d'accueil affichant la liste des discussions récentes.
class EcranAccueil extends StatefulWidget {
  const EcranAccueil({super.key});

  @override
  State<EcranAccueil> createState() => _EtatEcranAccueil();
}

class _EtatEcranAccueil extends State<EcranAccueil> {
  final List<ModeleDiscussion> _listeDiscussions = const [
    ModeleDiscussion(
      identifiant: '1',
      nomInterlocuteur: 'Alice Dupont',
      dernierMessage: 'Bonjour, tout se passe très bien ! L\'application est entièrement francisée.',
      heureDernierMessage: '10:18',
      nombreNonLu: 2,
      urlAvatar: '',
    ),
    ModeleDiscussion(
      identifiant: '2',
      nomInterlocuteur: 'Bruno Martin',
      dernierMessage: 'À bientôt pour la suite du projet.',
      heureDernierMessage: 'Hier',
      nombreNonLu: 0,
      urlAvatar: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messagerie Instantanée'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            tooltip: 'Rechercher',
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EcranParametres()),
              );
            },
            tooltip: 'Paramètres',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _listeDiscussions.length,
        itemBuilder: (contexte, index) {
          final discussion = _listeDiscussions[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal.shade200,
              child: Text(
                discussion.nomInterlocuteur[0],
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              discussion.nomInterlocuteur,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              discussion.dernierMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  discussion.heureDernierMessage,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                if (discussion.nombreNonLu > 0)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      discussion.nombreNonLu.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EcranDiscussion(discussion: discussion),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EcranContacts()),
          );
        },
        child: const Icon(Icons.chat, color: Colors.white),
        tooltip: 'Nouvelle discussion',
      ),
    );
  }
}
