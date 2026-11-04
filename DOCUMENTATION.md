# Documentation Technique - Projet Messagerie Instantanée

## 1. Architecture Générale
L'application **Messagerie Instantanée** est conçue selon une architecture modulaire et propre, inspirée des principes de séparation des préoccupations (Clean Architecture / MVC adapté à Flutter). 
- **Couche Présentation (Interfaces & Écrans)** : Composants graphiques et widgets Flutter pour l'affichage des listes de discussion et des fenêtres de message.
- **Couche Modèle (Données)** : Structures de données représentant les messages, les contacts et les conversations.
- **Couche Service (Logique & Stockage)** : Gestion de l'état local et persistance des discussions.

---

## 2. Liste Exhaustive des Écrans Identifiés
1. **Écran d'Accueil (Liste des Discussions)** : Affiche la liste des conversations récentes, l'état de connexion et l'accès aux paramètres.
2. **Écran de Discussion (Conversation)** : Permet d'envoyer et de recevoir des messages textuels avec affichage des bulles de messages.
3. **Écran des Contacts** : Permet de sélectionner un contact pour démarrer une nouvelle discussion.
4. **Écran des Paramètres** : Gestion du profil utilisateur, des préférences de notification et du thème.

---

## 3. Navigation entre les Écrans
- L'application démarre sur l'**Écran d'Accueil** (`EcranAccueil`).
- Un appui sur une conversation ouvre l'**Écran de Discussion** (`EcranDiscussion`).
- Un bouton flottant sur l'écran d'accueil permet d'accéder à l'**Écran des Contacts** (`EcranContacts`).
- Le menu supérieur donne accès aux **Paramètres** (`EcranParametres`).

---

## 4. Fonctionnalités de chaque Écran
- **Écran d'Accueil** : Affichage des avatars, des derniers messages, des horodatages et des indicateurs de messages non lus.
- **Écran de Discussion** : Saisie de texte, bouton d'envoi, distinction visuelle entre messages envoyés et reçus.
- **Écran des Contacts** : Recherche et sélection rapide dans le carnet d'adresses simulé.
- **Écran des Paramètres** : Configuration du nom d'utilisateur, du mode sombre/clair et consultation de la version de l'application.

---

## 5. Stockage des Données & Gestion d'État
- Utilisation de l'état local réactif de Flutter (`StatefulWidget` / `ChangeNotifier`) pour maintenir les listes de messages et de discussions en mémoire de session.
- Préparation pour une persistance locale (SharedPreferences / SQLite) pour les futures versions.

---

## 6. Permissions & Services
- **Permissions requises** : Accès Internet (pour les futurs services distants), stockage local.
- **Services intégrés** : Gestionnaire de notifications simulé, service de synchronisation des messages.
