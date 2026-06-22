-- =============================================================================
-- INSERTS POUR LES TABLES INDÉPENDANTES ET DE CONFIGURATION
-- =============================================================================

-- 9. Table sexe
INSERT INTO sexe (nom_sexe) VALUES 
('Homme'),
('Femme'),
('Non spécifié');

-- 6. Table type_client
INSERT INTO type_client (nom_type_client) VALUES 
('Particulier'),
('Entreprise / PME'),
('Association');

-- 4. Table competences_existant
INSERT INTO competences_existant (nom_competence) VALUES 
('Développement Web Fullstack'),
('Design Graphique & UI/UX'),
('Gestion de projet Agile'),
('Traduction Anglais-Français'),
('Community Management'),
('Montage Vidéo');

-- 7. Table admin
INSERT INTO admin (mail, motDePasse) VALUES 
('admin.ekandra@ekandra.com', 'hash_secure_password_admin_1'),
('super.admin@ekandra.com', 'hash_secure_password_admin_2');


-- =============================================================================
-- INSERTS POUR LES UTILISATEURS ET LEURS PROFILS
-- =============================================================================

-- 1. Table utilisateur
-- ID générés : 1 (Jean), 2 (Alice), 3 (Tech Solutions), 4 (ONG Partage)
INSERT INTO utilisateur (email, telephone, mot_de_passe, nom, prenoms, photo, adress, date_naissance) VALUES 
('jean.dupont@mail.com', '+33612345678', 'hash_pass_1', 'Dupont', 'Jean', 'avatar1.png', '123 Rue de Paris, Paris', '1990-05-15'),
('alice.martin@mail.com', '+33687654321', 'hash_pass_2', 'Martin', 'Alice', 'avatar2.png', '45 Avenue de Lyon, Lyon', '1995-09-22'),
('societe.tech@mail.com', '+33140000000', 'hash_pass_3', 'Tech Solutions', 'Direction', 'logo_tech.png', '8 Place de la Bourse, Bordeaux', NULL),
('ong.partage@mail.com', '+33250000000', 'hash_pass_4', 'ONG Partage', 'Secrétariat', 'ong.png', '12 Rue des Fleurs, Nantes', NULL);

-- 2. Table profil_prestataire
-- ID générés : 1 (pour Jean/Utilisateur 1), 2 (pour Alice/Utilisateur 2)
INSERT INTO profil_prestataire (id_utilisateur, description) VALUES 
(1, 'Développeur web passionné avec 5 ans d''expérience sur React et Node.js.'),
(2, 'Designer UX/UI et créatrice de contenu freelance.');

-- 3. Table competences_profil
INSERT INTO competences_profil (id_profil_prestataire, id_competence_existant) VALUES 
(1, 1), -- Jean (Prestataire 1) -> Dével. Web (1)
(1, 3), -- Jean (Prestataire 1) -> Gestion de projet (3)
(2, 2), -- Alice (Prestataire 2) -> Design Graphique (2)
(2, 5), -- Alice (Prestataire 2) -> Community Management (5)
(2, 6); -- Alice (Prestataire 2) -> Montage Vidéo (6)

-- 5. Table profil_client
-- ID générés : 1 (Jean/Utilisateur 1), 2 (Tech Solutions/Utilisateur 3), 3 (ONG Partage/Utilisateur 4)
INSERT INTO profil_client (id_utilisateur, id_type_client, nom_profil, adress, description) VALUES 
(1, 1, 'Profil Client de Jean', '123 Rue de Paris, Paris', 'Besoin ponctuel de relecture et traduction.'),
(3, 2, 'Tech Solutions HQ', '8 Place de la Bourse, Bordeaux', 'Entreprise de services numériques à la recherche de renforts indépendants.'),
(4, 3, 'ONG Partage Grand-Ouest', '12 Rue des Fleurs, Nantes', 'Association d''aide humanitaire.');


-- =============================================================================
-- INSERTS POUR LES MISSIONS ET CANDIDATURES
-- =============================================================================

-- 8. Table mission
-- ID générés : 1, 2, 3
-- Changement ici : On utilise bien les ID de profil_client existants (1, 2, 3)
INSERT INTO mission (id_profil_client, titre, budget, nombre_prestataire, id_sexe, delai_travail, description, statut_mission) VALUES 
(2, 'Création d''un site vitrine WordPress', 1500.00, 1, 3, '2 semaines', 'Recherchons un dev pour monter un site vitrine rapidement.', TRUE), -- Client : Tech Solutions (ID 2)
(2, 'Refonte charte graphique et logo', 800.00, 1, 3, '10 jours', 'Modernisation de l''identité visuelle de notre marque.', TRUE),       -- Client : Tech Solutions (ID 2)
(3, 'Traduction de rapports annuels', 450.00, 2, 2, '5 jours', 'Besoin de traductrices pour nos rapports en Anglais.', TRUE);           -- Client : ONG Partage (ID 3)

-- 10. Table competences_mission
INSERT INTO competences_mission (id_mission, id_competence_existant) VALUES 
(1, 1), -- Mission 1 -> Dével. Web
(2, 2), -- Mission 2 -> Design Graphique
(3, 4); -- Mission 3 -> Traduction

-- 11. Table demande_prestataire
INSERT INTO demande_prestataire (id_profil_prestataire, id_mission, statut_demande) VALUES 
(1, 1, TRUE),  -- Jean (Prestataire 1) a postulé à la mission 1
(2, 2, FALSE); -- Alice (Prestataire 2) a postulé à la mission 2


-- =============================================================================
-- INSERTS POUR LA GESTION FINANCIÈRE ET ÉVALUATIONS
-- =============================================================================

-- 12. Table solde_prestataire
INSERT INTO solde_prestataire (id_profil_prestataire, solde) VALUES 
(1, 450.50),
(2, 0.00);

-- 13. Table solde_client
INSERT INTO solde_client (id_profil_client, solde) VALUES 
(1, 100.00),
(2, 5000.00),
(3, 250.00);

-- 14. Table historique_transaction_prestataire
INSERT INTO historique_transaction_prestataire (id_profil_prestataire, montant) VALUES 
(1, 300.00),
(1, 150.50);

-- 15. Table historique_transaction_client
INSERT INTO historique_transaction_client (id_profil_client, montant) VALUES 
(2, -1500.00), 
(2, 2000.00);  

-- 16. Table caisse_Ekandra
INSERT INTO caisse_Ekandra (montant) VALUES 
(1250.75);

-- 17. Table evaluation_profil_prestataire
INSERT INTO evaluation_profil_prestataire (id_profil_client, id_profil_prestataire, note_evaluation) VALUES 
(2, 1, 5), -- Tech Solutions (Client 2) évalue Jean (Prestataire 1)
(3, 2, 4); -- ONG Partage (Client 3) évalue Alice (Prestataire 2)