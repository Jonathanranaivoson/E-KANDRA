#   Liste des fichiers et pages – E-KANDRA

---

## 1. Packages Model
Dossier contient les classes Java qui représentent les données de l'application.

* **Utilisateur.java** : Représente un utilisateur de la plateforme (Nom, Prénom, Email, Téléphone, Mot de passe, Rôle).
* **Client.java** : Représente un client. Permet la publication et la gestion des missions.
* **Prestataire.java** : Représente un prestataire. Permet la recherche de missions, les candidatures et la gestion du profil.
* **Administrateur.java** : Représente un administrateur. Permet la supervision de la plateforme.
* **Mission.java** : Représente une mission (Titre, Description, Budget, Catégorie, Type de mission, Statut).
* **Candidature.java** : Représente une candidature envoyée par un prestataire.
* **Evaluation.java** : Représente une évaluation laissée après une mission.
* **Message.java** : Représente un message envoyé dans une conversation.
* **Conversation.java** : Représente une discussion entre utilisateurs.
* **Wallet.java** : Représente le portefeuille virtuel d'un utilisateur. 
* **Transaction.java** : Représente une opération financière (Dépôt, Paiement, Commission, Retrait).
* **Verification.java** : Représente une demande de vérification d'identité.
* **Signalement.java** : Représente un signalement effectué contre un utilisateur.
* **Litige.java** : Représente un conflit entre client et prestataire.
* **LogAdmin.java** : Représente une action effectuée par un administrateur.

---

## 2. Packages DAO
Dossier gère les accès et les requêtes vers la base de données.

* **UtilisateurDAO.java** : Gestion de la table Utilisateur.
* **MissionDAO.java** : Gestion de la table Mission.
* **CandidatureDAO.java** : Gestion de la table Candidature.
* **EvaluationDAO.java** : Gestion de la table Evaluation.
* **MessageDAO.java** : Gestion de la table Message.
* **ConversationDAO.java** : Gestion de la table Conversation.
* **WalletDAO.java** : Gestion de la table Wallet.
* **TransactionDAO.java** : Gestion de la table Transaction.
* **VerificationDAO.java** : Gestion de la table Verification.
* **SignalementDAO.java** : Gestion de la table Signalement.
* **LitigeDAO.java** : Gestion de la table Litige.
* **LogAdminDAO.java** : Gestion de la table LogAdmin.

---

## 3. Packages Utils
Dossier contient les outils d'aide au bon fonctionnement du code.

* **Connexion.java** : Gestion de la connexion à PostgreSQL.
* **SessionUtils.java** : Gestion des sessions utilisateurs.
* **ValidationUtils.java** : Validation des formulaires (Email, Téléphone, Champs obligatoires).
* **Constantes.java** : Contient les constantes globales (Rôles, Statuts, Configurations).

---

## 4. Packages Exception
Dossier gère les erreurs spécifiques du système.

* **AppException.java** : Gestion des erreurs personnalisées de l'application.

---

## 5. Pages Visiteur (JSP)
Pages accessibles à tout le monde sans connexion.

* **index.jsp** : Page d'entrée de l'application.
* **accueil.jsp** : Présentation générale de E-KANDRA.
* **missions.jsp** : Liste des missions publiques.
* **prestataires.jsp** : Liste des prestataires visibles publiquement.
* **connexion.jsp** : Formulaire de connexion.
* **inscription.jsp** : Formulaire d'inscription.

---

## 6. Pages Client (JSP)
Pages réservées aux utilisateurs qui cherchent des prestataires.

* **dashboard.jsp** : Tableau de bord du client.
* **ajouterMission.jsp** : Publication d'une nouvelle mission.
* **modifierMission.jsp** : Modification d'une mission existante.
* **mesMissions.jsp** : Liste des missions publiées par le client.
* **candidatures.jsp** : Consultation des candidatures reçues.
* **paiements.jsp** : Consultation des paiements effectués.
* **historique.jsp** : Historique des missions et paiements.
* **evaluation.jsp** : Évaluation du prestataire après une mission.

---

## 7. Pages Prestataire (JSP)
Pages réservées aux travailleurs indépendants.

* **dashboard.jsp** : Tableau de bord du prestataire.
* **profil.jsp** : Gestion du profil professionnel.
* **verification.jsp** : Demande de badge vérifié.
* **rechercherMission.jsp** : Recherche et filtrage des missions.
* **detailMission.jsp** : Consultation détaillée d'une mission.
* **postuler.jsp** : Envoi d'une candidature.
* **mesCandidatures.jsp** : Suivi des candidatures envoyées.
* **wallet.jsp** : Consultation du portefeuille virtuel.
* **historique.jsp** : Historique des missions et revenus.

---

## 8. Pages Messagerie (JSP)
Espace d'échange direct.

* **conversation.jsp** : Discussion entre client et prestataire (Messages, Partage de fichiers).

---

## 9. Pages Administrateur (JSP)
Pages de contrôle réservées à la gestion de la plateforme.

* **dashboard.jsp** : Vue générale de la plateforme.
* **utilisateurs.jsp** : Gestion des comptes utilisateurs.
* **missions.jsp** : Gestion et supervision des missions.
* **paiements.jsp** : Gestion des transactions financières.
* **litiges.jsp** : Gestion des litiges.
* **signalements.jsp** : Gestion des signalements utilisateurs.
* **verifications.jsp** : Validation ou refus des badges vérifiés.
* **logs.jsp** : Consultation du journal des actions administratives.
* **statistiques.jsp** : Statistiques globales (Utilisateurs, Missions, Revenus).

---

## 10. Pages d'Erreur (JSP)
* **erreur.jsp** : Affichage des messages d'erreur de l'application.

---

## 11. Fichiers CSS
* **style.css** : Feuille de style principale (Couleurs, Typographie, Mise en page, Responsive).

---

## 12. Fichiers SQL
* **schema.sql** : Création de toutes les tables de la base de données.
* **data.sql** : Insertion des données de démonstration et de test.

---

## 13. Fichiers de Déploiement
* **deploy.sh** : Script de déploiement sous Linux.
* **run.bat** : Script de lancement sous Windows.

---

##  Récapitulatif an le fichier sy pages rehetra

### Code Java
* **15** classes Model
* **12** classes DAO
* **4** classes utilitaires (Utils)
* **1** classe Exception

### Interfaces (JSP)
* **6** pages Visiteur
* **8** pages Client
* **9** pages Prestataire
* **1** page Messagerie
* **9** pages Administrateur
* **1** page Erreur
* **Total** : 34 pages JSP 

### Autres ressources
* **1** fichier CSS
* **2** fichiers SQL
* **2** scripts de déploiement
