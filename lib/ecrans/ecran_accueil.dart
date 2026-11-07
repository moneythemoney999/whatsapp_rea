import 'package:flutter/material.dart';
import '../modeles/modele_discussion.dart';
import 'ecran_discussion.dart';
import 'ecran_contacts.dart';
import 'ecran_parametres.dart';

/// Écran d'accueil principal style WhatsApp avec onglets (Discussions, Statuts, Appels).
class EcranAccueilWhatsApp extends StatefulWidget {
  const EcranAccueilWhatsApp({super.key});

  @override
  State<EcranAccueilWhatsApp> createState() => _EtatEcranAccueilWhatsApp();
}

class _EtatEcranAccueilWhatsApp extends State<EcranAccueilWhatsApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<ModeleDiscussion> _listeDiscussions = const [
    ModeleDiscussion(
      identifiant: '1',
      nomInterlocuteur: 'Alice Dupont',
      dernierMessage: 'Salut ! Le nouveau design est vraiment super.',
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
    ModeleDiscussion(
      identifiant: '3',
      nomInterlocuteur: 'Chantal Bernard',
      dernierMessage: 'Conférence prévue à 14h.',
      heureDernierMessage: 'Lundi',
      nombreNonLu: 1,
      urlAvatar: '',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
            tooltip: 'Appareil photo',
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            tooltip: 'Rechercher',
          ),
          PopupMenuButton<String>(
            onSelected: (valeur) {
              if (valeur == 'parametres') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EcranParametres()),
                );
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(value: 'groupe', child: Text('Nouveau groupe')),
              const PopupMenuItem(value: 'diffulsion', child: Text('Nouvelle diffusion')),
              const PopupMenuItem(value: 'appareil', child: Text('Appareils connectés')),
              const PopupMenuItem(value: 'favoris', child: Text('Favoris')),
              const PopupMenuItem(value: 'parametres', child: Text('Paramètres')),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'DISCUSSIONS'),
            Tab(text: 'STATUTS'),
            Tab(text: 'APPELS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Onglet Discussions
          ListView.builder(
            itemCount: _listeDiscussions.length,
            itemBuilder: (contexte, index) {
              final discussion = _listeDiscussions[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFF128C7E),
                  child: Text(
                    discussion.nomInterlocuteur[0],
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  discussion.nomInterlocuteur,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Row(
                  children: [
                    const Icon(Icons.done_all, size: 16, color: Colors.blue),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        discussion.dernierMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      discussion.heureDernierMessage,
                      style: TextStyle(fontSize: 12, color: discussion.nombreNonLu > 0 ? const Color(0xFF25D366) : Colors.grey.shade600, fontWeight: discussion.nombreNonLu > 0 ? FontWeight.bold : FontWeight.normal),
                    ),
                    const SizedBox(height: 6),
                    if (discussion.nombreNonLu > 0)
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xFF25D366),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          discussion.nombreNonLu.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
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
          // Onglet Statuts
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ListTile(
                leading: Stack(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF25D366),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, size: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                title: const Text('Mon statut', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Appuyez pour ajouter une mise à jour'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Mises à jour récentes', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFF075E54),
                  child: const Text('A', style: TextStyle(color: Colors.white)),
                ),
                title: const Text('Alice Dupont'),
                subtitle: const Text("Aujourd'hui, 09:45"),
                onTap: () {},
              ),
            ],
          ),
          // Onglet Appels
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFF25D366),
                  child: const Icon(Icons.link, color: Colors.white),
                ),
                title: const Text('Créer un lien d\'appel', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Partagez un lien pour votre appel WhatsApp'),
                onTap: () {},
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Récents', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Text('B', style: TextStyle(color: Colors.white)),
                ),
                title: const Text('Bruno Martin'),
                subtitle: Row(
                  children: const [
                    Icon(Icons.call_received, size: 16, color: Colors.green),
                    SizedBox(width: 4),
                    Text('Hier, 18:30'),
                  ],
                ),
                trailing: const Icon(Icons.call, color: Color(0xFF075E54)),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
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
