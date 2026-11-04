/// Modèle représentant une discussion dans l'application de messagerie.
class ModeleDiscussion {
  final String identifiant;
  final String nomInterlocuteur;
  final String dernierMessage;
  final String heureDernierMessage;
  final int nombreNonLu;
  final String urlAvatar;

  const ModeleDiscussion({
    required this.identifiant,
    required this.nomInterlocuteur,
    required this.dernierMessage,
    required this.heureDernierMessage,
    required this.nombreNonLu,
    required this.urlAvatar,
  });
}

/// Modèle représentant un message individuel.
class ModeleMessage {
  final String identifiant;
  final String texte;
  final String heure;
  final bool estEnvoyeParUtilisateur;

  const ModeleMessage({
    required this.identifiant,
    required this.texte,
    required this.heure,
    required this.estEnvoyeParUtilisateur,
  });
}
