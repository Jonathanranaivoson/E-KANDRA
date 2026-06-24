package model.utilisateur;

import java.sql.Timestamp;

public class Client {
    Integer id_profil_client;
    Integer id_utilisateur;
    Integer id_type_client;
    String nom_profil;
    String adress;
    String description;
    Timestamp date_creation;
    
    public Integer getId_profil_client() {
        return id_profil_client;
    }
    public void setId_profil_client(Integer id_profil_client) {
        this.id_profil_client = id_profil_client;
    }
    public Integer getId_utilisateur() {
        return id_utilisateur;
    }
    public void setId_utilisateur(Integer id_utilisateur) {
        this.id_utilisateur = id_utilisateur;
    }
    public Integer getId_type_client() {
        return id_type_client;
    }
    public void setId_type_client(Integer id_type_client) {
        this.id_type_client = id_type_client;
    }
    public String getNom_profil() {
        return nom_profil;
    }
    public void setNom_profil(String nom_profil) {
        this.nom_profil = nom_profil;
    }
    public String getAdress() {
        return adress;
    }
    public void setAdress(String adress) {
        this.adress = adress;
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
