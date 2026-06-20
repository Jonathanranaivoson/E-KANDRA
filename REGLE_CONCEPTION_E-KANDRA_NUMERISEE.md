# REGLES DE GESTION ET ORGANISATION DES UTILISATEURS – E-KANDRA

---
## Conception pour la Modelisation UML (cas d'utilisation)
## Ce fichier est la base de conception: BDD, Regle logique/metier(Back-End)
## RÉSUMÉ DES ACTEURS

*   **VISITEUR**
    *   **Objectif :** Découvrir la plateforme et s'inscrire.
*   **CLIENT**
    *   **Objectif :** Publier des missions et recruter des prestataires.
*   **PRESTATAIRE**
    *   **Objectif :** Réaliser des missions et gagner de l'argent.
*   **ADMINISTRATEUR**
    *   **Objectif :** Superviser, sécuriser et gérer la plateforme.

---

## 1. VISITEUR

### ACTIONS POSSIBLES

#### 1. Consulter la plateforme
Le visiteur peut :
*   Accéder à la page d'accueil.
*   Découvrir le concept E-KANDRA.
*   Voir les catégories de missions.
*   Consulter certaines missions publiques.
*   Consulter les profils publics des prestataires.
*   Lire les avis et évaluations.

#### 2. Créer un compte
Le visiteur peut :
*   S'inscrire en tant que Client.
*   S'inscrire en tant que Prestataire.

#### 3. Se connecter
Le visiteur peut accéder à son espace personnel après authentification.

### FONCTIONNALITÉS ACCESSIBLES

*   Consultation des missions.
*   Consultation des profils publics.
*   Recherche simple.
*   Inscription.
*   Connexion.
*   Réinitialisation du mot de passe.

### RÈGLES DE GESTION

#### Gestion de l'accès
*   Un visiteur peut accéder librement à la page d'accueil.
*   Un visiteur peut consulter les informations générales de la plateforme sans authentification.
*   Un visiteur peut consulter les catégories de missions disponibles.
*   Un visiteur peut visualiser les profils publics des prestataires.
*   Un visiteur peut consulter les évaluations et avis publics.

#### Gestion des comptes
*   Un visiteur doit créer un compte avant de pouvoir interagir avec une mission.
*   Une adresse email ne peut être utilisée qu'une seule fois.
*   Un numéro de téléphone ne peut être associé qu'à un seul compte actif.
*   Le système doit vérifier l'unicité de l'email lors de l'inscription.
*   Le système doit vérifier l'unicité du numéro de téléphone lors de l'inscription.
*   Le compte reste inactif tant que l'email n'est pas confirmé.
*   Un visiteur non authentifié ne peut pas envoyer de message à un utilisateur.
*   Un visiteur non authentifié ne peut pas publier une mission.
*   Un visiteur non authentifié ne peut pas postuler à une mission.
*   Un visiteur non authentifié ne peut pas accéder aux fonctionnalités financières.
*   Toute tentative d'accès à une fonctionnalité protégée doit rediriger vers la page de connexion.

---

## 2. CLIENT

### ACTIONS POSSIBLES

#### 1. Gestion du compte
Le client peut :
*   Modifier son profil.
*   Modifier son mot de passe.
*   Ajouter une photo de profil.
*   Vérifier son email.
*   Vérifier son numéro de téléphone.

#### 2. Gestion des missions
*   **A. Publier une mission :** Il renseigne le Titre, la Description, le Budget, la Catégorie et la Date limite.
*   **B. Modifier une mission :** Uniquement si aucune candidature n'a été acceptée.
*   **C. Supprimer une mission :** Uniquement si la mission n'est pas encore attribuée.

#### 3. Gestion des candidatures
Le client peut :
*   Consulter les candidatures reçues.
*   Consulter les profils des prestataires.
*   Accepter une candidature.
*   Refuser une candidature.

#### 4. Paiement
Le client peut :
*   Déposer l'argent de la mission sur E-KANDRA.
*   Effectuer un paiement Mobile Money.
*   Consulter ses paiements.

#### 5. Messagerie
Le client peut :
*   Discuter avec le prestataire sélectionné.
*   Envoyer des pièces jointes.
*   Recevoir des messages.

#### 6. Validation de mission
Le client peut :
*   Accepter le travail livré.
*   Demander des corrections.
*   Déclarer un litige.

#### 7. Évaluation
Le client peut :
*   Noter le prestataire.
*   Donner un commentaire.

#### 8. Historique
Le client peut consulter :
*   Missions publiées.
*   Missions terminées.
*   Paiements effectués.
*   Évaluations données.

### FONCTIONNALITÉS ACCESSIBLES

*   Tableau de bord client.
*   Publication de mission.
*   Gestion des candidatures.
*   Paiement Mobile Money.
*   Messagerie.
*   Historique.
*   Notifications.
*   Évaluation.

### RÈGLES DE GESTION

#### Gestion du compte
*   Le client doit être connecté pour accéder à son espace personnel.
*   Le client peut modifier ses informations personnelles à tout moment.
*   Le client peut changer son mot de passe après vérification de son identité.
*   Le client peut ajouter ou modifier sa photo de profil.
*   Le client doit confirmer son adresse email avant d'utiliser les fonctionnalités financières.
*   Le client doit vérifier son numéro de téléphone avant d'effectuer un paiement.

#### Publication des missions
*   Une mission doit obligatoirement contenir un titre.
*   Une mission doit obligatoirement contenir une description.
*   Une mission doit obligatoirement appartenir à une catégorie.
*   Une mission doit obligatoirement posséder un budget.
*   Une mission doit posséder une date limite valide.
*   Une mission ne peut être publiée qu'après validation des champs obligatoires.
*   Une mission publiée devient visible pour tous les prestataires.

#### Modification des missions
*   Le client peut modifier une mission tant qu'aucun prestataire n'a été sélectionné.
*   Une mission en cours ne peut plus être modifiée.
*   Une mission terminée ne peut plus être modifiée.
*   Toute modification importante doit être enregistrée dans l'historique.

#### Suppression des missions
*   Une mission sans candidature peut être supprimée librement.
*   Une mission avec candidatures peut être supprimée uniquement avant sélection d'un prestataire.
*   Une mission attribuée ne peut plus être supprimée.
*   Une mission terminée reste archivée dans le système.

#### Gestion des candidatures
*   Le client peut consulter toutes les candidatures reçues.
*   Le client peut comparer les propositions des prestataires.
*   Le client ne peut sélectionner qu'un seul prestataire par mission.
*   Une candidature acceptée entraîne automatiquement le refus des autres candidatures.
*   Une candidature refusée ne peut plus être réactivée automatiquement.

#### Paiement
*   Le paiement de la mission doit être effectué avant le démarrage de la mission.
*   Les fonds sont conservés temporairement par E-KANDRA.
*   Le client ne peut pas récupérer les fonds une fois la mission démarrée sauf en cas de litige validé.
*   Le paiement est libéré uniquement après validation du travail livré.
*   Chaque transaction doit être enregistrée dans l'historique.
*   Toutes les transactions doivent être réalisées via les moyens de paiement autorisés par la plateforme.

#### Validation du travail
*   Le client peut accepter la livraison.
*   Le client peut demander des corrections.
*   Le client peut ouvrir un litige.
*   Le client doit motiver toute demande de correction.
*   Le client doit justifier l'ouverture d'un litige.
*   Une mission acceptée est automatiquement marquée comme terminée.

#### Évaluation
*   Une évaluation n'est possible qu'après la clôture de la mission.
*   Une seule évaluation est autorisée par mission.
*   Une évaluation publiée devient visible publiquement.
*   Une évaluation ne peut être supprimée que par un administrateur.

#### Messagerie
*   La messagerie n'est accessible qu'aux utilisateurs concernés par la mission.
*   Tous les messages sont archivés.
*   Les pièces jointes doivent respecter les formats autorisés.
*   Les messages supprimés restent accessibles aux administrateurs.

---

## 3. PRESTATAIRE

### ACTIONS POSSIBLES

#### 1. Gestion du compte
Le prestataire peut :
*   Modifier son profil.
*   Ajouter une photo.
*   Ajouter ses compétences.
*   Ajouter une description professionnelle.

#### 2. Vérification du profil
Le prestataire peut :
*   Vérifier son email.
*   Vérifier son téléphone.
*   Soumettre une pièce d'identité.
*   *Après validation :* Obtenir le Badge Vérifié.

#### 3. Recherche des missions
Le prestataire peut :
*   Parcourir les missions.
*   Rechercher des missions.
*   Filtrer les missions.
*   *Filtres disponibles :* Catégorie, Budget, Localisation, Date.

#### 4. Dépôt de candidature
Le prestataire peut :
*   Consulter les détails d'une mission.
*   Envoyer une candidature.
*   *La candidature contient :* Proposition, Prix proposé, Délai.

#### 5. Dépôt de garantie de candidature
Pour éviter les candidatures non sérieuses, réduire les fausses candidatures et réduire les abandons :
*   Le prestataire doit payer un petit dépôt de garantie lors de la candidature.
*   Le dépôt est remboursé si la mission est réalisée correctement ou déduit des frais futurs.

#### 6. Réalisation de mission
Le prestataire peut :
*   Accepter une mission.
*   Livrer le travail.
*   Envoyer des fichiers.
*   Répondre aux demandes du client.

#### 7. Paiement
Le prestataire peut :
*   Consulter ses revenus.
*   Consulter les paiements reçus.
*   Demander un retrait Mobile Money.

#### 8. Historique
Le prestataire peut consulter :
*   Missions réalisées.
*   Revenus.
*   Paiements.
*   Candidatures passées.

#### 9. Signalement
Le prestataire peut :
*   Signaler un client.
*   Signaler un comportement abusif.
*   Signaler une fraude.

### FONCTIONNALITÉS ACCESSIBLES

*   Tableau de bord prestataire.
*   Recherche avancée.
*   Dépôt de candidature.
*   Messagerie.
*   Livraison de mission.
*   Historique.
*   Notifications.
*   Gestion des revenus.
*   Badge vérifié.

### RÈGLES DE GESTION

#### Gestion du compte
*   Le prestataire doit posséder un compte actif.
*   Le prestataire peut modifier ses compétences.
*   Le prestataire peut mettre à jour son profil professionnel.
*   Le prestataire est responsable de l'exactitude des informations fournies.

#### Vérification d'identité
*   La vérification d'identité est facultative mais recommandée.
*   Le badge vérifié n'est attribué qu'après validation administrative.
*   Un document falsifié entraîne une suspension du compte.
*   Une identité refusée peut être soumise à nouveau.

#### Recherche des missions
*   Le prestataire peut consulter toutes les missions/offres ouvertes.
*   Le prestataire peut filtrer les missions par catégorie.
*   Le prestataire peut filtrer les missions par budget.
*   Le prestataire peut filtrer les missions par date.
*   Le prestataire peut effectuer une recherche par mot-clé.

#### Dépôt de candidature
*   Le prestataire doit être connecté pour postuler.
*   Une candidature doit contenir une proposition.
*   Une candidature doit contenir un délai estimatif.
*   Une candidature doit contenir un montant proposé.
*   Le système interdit les candidatures incomplètes.

#### Dépôt de garantie
*   Le dépôt de garantie est obligatoire pour soumettre une candidature.
*   Le montant du dépôt est défini par la plateforme.
*   Le dépôt vise à limiter les candidatures non sérieuses.
*   Le dépôt ne peut pas être remboursé à la fin de la mission.
*   Le dépôt ne peut pas etre rembourse quelques soit la raison.

#### Réalisation des missions
*   Le prestataire doit respecter le délai annoncé.
*   Le prestataire peut livrer plusieurs versions du travail.
*   Le prestataire peut répondre aux demandes de correction.
*   Le prestataire ne peut pas abandonner une mission sans justification.

#### Paiement
*   Le paiement n'est effectué qu'après validation du client.
*   La commission E-KANDRA est prélevée automatiquement.
*   Les revenus sont enregistrés dans le portefeuille du prestataire.
*   Le prestataire peut demandeur un retrait Mobile Money.
*   Un retrait peut être bloqué en cas de litige.

#### Signalement
*   Le prestataire peut signaler un client.
*   Un signalement doit contenir une justification.
*   Les signalements abusifs peuvent être sanctionnés.
*   Tous les signalements sont conservés dans le système.

#### Suspension
*   Un prestataire suspendu ne peut plus postuler.
*   Un prestataire suspendu conserve son historique.
*   Une suspension peut être temporaire ou définitive.

---

## 4. ADMINISTRATEUR

### ACTIONS POSSIBLES

#### 1. Gestion des utilisateurs
L'administrateur peut :
*   Consulter tous les comptes.
*   Vérifier les profils.
*   Suspendre un compte.
*   Réactiver un compte.
*   Supprimer définitivement un compte.

#### 2. Gestion des missions
L'administrateur peut :
*   Consulter toutes les missions.
*   Consulter les candidatures.
*   Intervenir en cas de litige.

#### 3. Gestion financière
L'administrateur peut :
*   Consulter toutes les transactions.
*   Bloquer un paiement.
*   Débloquer un paiement.
*   Annuler une transaction.
*   Gérer les commissions.

#### 4. Gestion des signalements
L'administrateur peut :
*   Consulter les signalements.
*   Enquêter.
*   Sanctionner un utilisateur.

#### 5. Gestion des badges
L'administrateur peut :
*   Valider une identité.
*   Refuser une vérification.
*   Attribuer un badge vérifié.

#### 6. Statistiques
L'administrateur peut consulter :
*   Nombre de clients.
*   Nombre de prestataires.
*   Nombre de missions.
*   Missions terminées.
*   Missions annulées.
*   Revenus de la plateforme.
*   Commissions collectées.
*   Utilisateurs actifs.

### FONCTIONNALITÉS ACCESSIBLES

*   Tableau de bord administrateur.
*   Gestion utilisateurs.
*   Gestion missions.
*   Gestion paiements.
*   Gestion litiges.
*   Gestion signalements.
*   Gestion badges.
*   Statistiques.

### RÈGLES DE GESTION

#### Gestion des utilisateurs
*   L'administrateur peut consulter tous les comptes.
*   L'administrateur peut suspendre temporairement un compte.
*   L'administrateur peut réactiver un compte suspendu.
*   L'administrateur peut supprimer définitivement un compte.
*   Toute action administrative doit être enregistrée dans un journal.

#### Gestion des missions
*   L'administrateur peut consulter toutes les missions.
*   L'administrateur peut intervenir lors d'un litige.
*   L'administrateur peut fermer une mission frauduleuse.
*   L'administrateur peut suspendre une mission suspecte.

#### Gestion financière
*   L'administrateur peut consulter toutes les transactions.
*   L'administrateur peut bloquer un paiement.
*   L'administrateur peut débloquer un paiement.
*   L'administrateur peut annuler une transaction après enquête.
*   Toutes les opérations financières doivent être tracées.

#### Gestion des litiges
*   Un litige doit être analysé avant toute décision.
*   Les deux parties doivent pouvoir présenter leurs preuves.
*   L'administrateur peut demander des informations complémentaires.
*   La décision finale doit être enregistrée dans l'historique.

#### Gestion des signalements
*   Chaque signalement doit être étudié.
*   Un signalement validé peut entraîner une sanction.
*   Les sanctions peuvent être progressives.
*   Les récidives peuvent entraîner une exclusion définitive.

#### Gestion des badges
*   Seul un administrateur peut attribuer un badge vérifié.
*   Seul un administrateur peut retirer un badge vérifié.
*   Chaque décision doit être justifiée.

#### Conservation des données
*   Les historiques de missions sont conservés de manière permanente.
*   Les historiques de transactions sont conservés de manière permanente.
*   Les historiques de connexion sont conservés pour des raisons de sécurité.
*   Les données supprimées peuvent être archivées selon la politique interne.

#### Sécurité
*   Toutes les actions sensibles doivent être journalisées.
*   Les accès administrateurs doivent être sécurisés.
*   Les tentatives de fraude doivent être signalées automatiquement.
*   Les comptes suspects peuvent être bloqués préventivement.

---
### Version numerisee des regles et directives de l'utilisation
