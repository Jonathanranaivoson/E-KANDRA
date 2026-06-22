-- Création de la base de données (À exécuter séparément si nécessaire)
 CREATE DATABASE "E_Kandra";

\c E_Kandra;

-- 9. Table sexe (nécessaire pour la table mission)
CREATE TABLE sexe (
    id_sexe SERIAL PRIMARY KEY,
    nom_sexe VARCHAR(50) NOT NULL
);

-- 6. Table type_client (nécessaire pour profil_client)
CREATE TABLE type_client (
    id_type_client SERIAL PRIMARY KEY,
    nom_type_client VARCHAR(100) NOT NULL
);

-- 4. Table competences_existant
CREATE TABLE competences_existant (
    id_competence_existant SERIAL PRIMARY KEY,
    nom_competence VARCHAR(150) UNIQUE NOT NULL
);

-- 7. Table admin
CREATE TABLE admin (
    id_admin SERIAL PRIMARY KEY,
    mail VARCHAR(255) UNIQUE NOT NULL,
    motDePasse VARCHAR(255) NOT NULL
);

-- 1. Table utilisateur
CREATE TABLE utilisateur (
    id_utilisateur SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    telephone VARCHAR(20),
    mot_de_passe VARCHAR(255) NOT NULL,
    nom VARCHAR(100) NOT NULL,
    prenoms VARCHAR(150),
    photo VARCHAR(255),
    adress TEXT,
    date_naissance DATE
);

-- 2. Table profil_prestataire
CREATE TABLE profil_prestataire (
    id_profil_prestataire SERIAL PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    description TEXT,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_profil_prest_utilisateur FOREIGN KEY (id_utilisateur) 
        REFERENCES utilisateur(id_utilisateur) ON DELETE CASCADE
);

-- 3. Table competences_profil (Table de liaison Many-to-Many)
CREATE TABLE competences_profil (
    id_profil_prestataire INT,
    id_competence_existant INT,
    PRIMARY KEY (id_profil_prestataire, id_competence_existant),
    CONSTRAINT fk_comp_prof_prestataire FOREIGN KEY (id_profil_prestataire) 
        REFERENCES profil_prestataire(id_profil_prestataire) ON DELETE CASCADE,
    CONSTRAINT fk_comp_prof_competence FOREIGN KEY (id_competence_existant) 
        REFERENCES competences_existant(id_competence_existant) ON DELETE CASCADE
);

-- 5. Table profil_client
CREATE TABLE profil_client (
    id_profil_client SERIAL PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    id_type_client INT NOT NULL,
    nom_profil VARCHAR(100),
    adress TEXT,
    description TEXT,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_profil_cli_utilisateur FOREIGN KEY (id_utilisateur) 
        REFERENCES utilisateur(id_utilisateur) ON DELETE CASCADE,
    CONSTRAINT fk_profil_cli_type FOREIGN KEY (id_type_client) 
        REFERENCES type_client(id_type_client) ON DELETE RESTRICT
);

-- 8. Table mission
CREATE TABLE mission (
    id_mission SERIAL PRIMARY KEY,
    id_profil_client INT NOT NULL,
    titre VARCHAR(255) NOT NULL,
    budget NUMERIC(12, 2),
    nombre_prestataire INT DEFAULT 1,
    id_sexe INT,
    delai_travail VARCHAR(100),
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    statut_mission BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_mission_client FOREIGN KEY (id_profil_client) 
        REFERENCES profil_client(id_profil_client) ON DELETE CASCADE,
    CONSTRAINT fk_mission_sexe FOREIGN KEY (id_sexe) 
        REFERENCES sexe(id_sexe) ON DELETE SET NULL
);

-- 10. Table competences_mission (Table de liaison Many-to-Many)
CREATE TABLE competences_mission (
    id_mission INT,
    id_competence_existant INT,
    PRIMARY KEY (id_mission, id_competence_existant),
    CONSTRAINT fk_comp_miss_mission FOREIGN KEY (id_mission) 
        REFERENCES  mission(id_mission) ON DELETE CASCADE,
    CONSTRAINT fk_comp_miss_competence FOREIGN KEY (id_competence_existant) 
        REFERENCES competences_existant(id_competence_existant) ON DELETE CASCADE
);

-- 11. Table demande_prestataire
CREATE TABLE demande_prestataire (
    id_demande_prestataire SERIAL PRIMARY KEY,
    id_profil_prestataire INT NOT NULL,
    id_mission INT NOT NULL,
    date_demande TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    statut_demande BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_demande_prestataire FOREIGN KEY (id_profil_prestataire) 
        REFERENCES profil_prestataire(id_profil_prestataire) ON DELETE CASCADE,
    CONSTRAINT fk_demande_mission FOREIGN KEY (id_mission) 
        REFERENCES mission(id_mission) ON DELETE CASCADE
);

-- 12. Table solde_prestataire
CREATE TABLE solde_prestataire (
    id_solde_prestataire SERIAL PRIMARY KEY,
    id_profil_prestataire INT NOT NULL,
    date_depot TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    solde FLOAT DEFAULT 0.0,
    CONSTRAINT fk_solde_prestataire FOREIGN KEY (id_profil_prestataire) 
        REFERENCES profil_prestataire(id_profil_prestataire) ON DELETE CASCADE
);

-- 13. Table solde_client
CREATE TABLE solde_client (
    id_solde_client SERIAL PRIMARY KEY,
    id_profil_client INT NOT NULL,
    date_depot TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    solde FLOAT DEFAULT 0.0,
    CONSTRAINT fk_solde_client FOREIGN KEY (id_profil_client) 
        REFERENCES profil_client(id_profil_client) ON DELETE CASCADE
);

-- 14. Table historique_transaction_prestataire
CREATE TABLE historique_transaction_prestataire (
    id_historique_trans_prest SERIAL PRIMARY KEY, -- Ajout d'une PK pour PostgreSQL
    id_profil_prestataire INT NOT NULL,
    montant FLOAT NOT NULL,
    date_transaction TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_trans_prestataire FOREIGN KEY (id_profil_prestataire) 
        REFERENCES profil_prestataire(id_profil_prestataire) ON DELETE CASCADE
);

-- 15. Table historique_transaction_client
CREATE TABLE historique_transaction_client (
    id_historique_trans_cli SERIAL PRIMARY KEY, -- Ajout d'une PK pour PostgreSQL
    id_profil_client INT NOT NULL,
    montant FLOAT NOT NULL,
    date_transaction TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_trans_client FOREIGN KEY (id_profil_client) 
        REFERENCES profil_client(id_profil_client) ON DELETE CASCADE
);

-- 16. Table caisse_Ekandra
CREATE TABLE caisse_Ekandra (
    id_caisse SERIAL PRIMARY KEY, -- Ajout recommandé d'une PK
    montant FLOAT DEFAULT 0.0
);

-- 17. Table evaluation_profil_prestataire
CREATE TABLE evaluation_profil_prestataire (
    id_evaluation SERIAL PRIMARY KEY,
    id_profil_client INT NOT NULL,
    id_profil_prestataire INT NOT NULL,
    note_evaluation INT CHECK (note_evaluation BETWEEN 0 AND 5), -- Contrainte optionnelle pour la notation
    CONSTRAINT fk_eval_client FOREIGN KEY (id_profil_client) 
        REFERENCES profil_client(id_profil_client) ON DELETE CASCADE,
    CONSTRAINT fk_eval_prestataire FOREIGN KEY (id_profil_prestataire) 
        REFERENCES profil_prestataire(id_profil_prestataire) ON DELETE CASCADE
);