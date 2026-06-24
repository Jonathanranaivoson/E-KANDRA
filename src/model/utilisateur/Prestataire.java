package model.utilisateur;

import java.sql.Timestamp;

public class Prestataire {
    Integer id_profil_prestataire;
    Integer id_utilisateur;
    String description;
    Timestamp date_creation;
    
    public Integer getId_profil_prestataire() {
        return id_profil_prestataire;
    }
    public void setId_profil_prestataire(Integer id_profil_prestataire) {
        this.id_profil_prestataire = id_profil_prestataire;
    }
    public Integer getId_utilisateur() {
        return id_utilisateur;
    }
    public void setId_utilisateur(Integer id_utilisateur) {
        this.id_utilisateur = id_utilisateur;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public Timestamp getDate_creation() {
        return date_creation;
    }
    public void setDate_creation(Timestamp date_creation) {
        this.date_creation = date_creation;
    }
}
