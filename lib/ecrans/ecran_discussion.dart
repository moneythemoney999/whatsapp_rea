import 'package:flutter/material.dart';
import '../modeles/modele_discussion.dart';

/// Écran de discussion affichant les messages échangés avec un interlocuteur.
class EcranDiscussion extends StatefulWidget {
  final ModeleDiscussion discussion;

  const EcranDiscussion({super.key, required this.discussion});

  @override
  State<EcranDiscussion> createState() => _EtatEcranDiscussion();
}

class _EtatEcranDiscussion extends State<EcranDiscussion> {
  final TextEditingController _controleurSaisie = TextEditingController();
  final ScrollController _controleurDefilement = ScrollController();

  // Liste initiale des messages pour la démonstration
  final List<ModeleMessage> _listeMessages = [
    ModeleMessage(
      identifiant: '1',
      texte: 'Bonjour ! Comment va le projet de reconstruction ?',
      heure: '10:15',
      estEnvoyeParUtilisateur: false,
    ),
    ModeleMessage(
      identifiant: '2',
      texte: 'Bonjour, tout se passe très bien ! L\'application est entièrement francisée.',
      heure: '10:18',
      estEnvoyeParUtilisateur: true,
    ),
  ];

  /// Fonction pour envoyer un nouveau message.
  void _envoyerMessage() {
    final String texteSaisi = _controleurSaisie.text.trim();
    if (texteSaisi.isEmpty) return;

    setState(() {
      _listeMessages.add(
        ModeleMessage(
          identifiant: DateTime.now().millisecondsSinceEpoch.toString(),
          texte: texteSaisi,
          heure: TimeOfDay.now().format(context),
          estEnvoyeParUtilisateur: true,
        ),
      );
      _controleurSaisie.clear();
    });

    // Faire défiler vers le bas
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_controleurDefilement.hasClients) {
        _controleurDefilement.animateTo(
          _controleurDefilement.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal.shade200,
              child: Text(
                widget.discussion.nomInterlocuteur[0],
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.discussion.nomInterlocuteur,
                  style: const TextStyle(fontSize: 16),
                ),
                const Text(
                  'En ligne',
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
            tooltip: 'Appel vidéo',
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
            tooltip: 'Appel vocal',
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
            tooltip: 'Plus d\'options',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controleurDefilement,
              padding: const EdgeInsets.all(16.0),
              itemCount: _listeMessages.length,
              itemBuilder: (contexte, index) {
                final ModeleMessage message = _listeMessages[index];
                final bool estEnvoye = message.estEnvoyeParUtilisateur;

                return Align(
                  alignment: estEnvoye ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: estEnvoye ? Colors.teal.shade100 : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          message.texte,
                          style: const TextStyle(fontSize: 15.0, color: Colors.black87),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          message.heure,
                          style: TextStyle(fontSize: 10.0, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _controleurSaisie,
                    decoration: const InputDecoration(
                      hintText: 'Tapez un message...',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (_) => _envoyerMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: () {},
                ),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.teal,
                  onPressed: _envoyerMessage,
                  child: const Icon(Icons.send, color: Colors.white, size: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
