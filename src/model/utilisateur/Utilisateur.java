package model.utilisateur;

import java.sql.Date;

public class Utilisateur {
    Integer id_utilisateur;
    String email;
    String telephone;
    String mot_de_passe;
    String nom;
    String prenoms;
    String photo;
    String adress;
    Date date_naissance;

    public Integer getId_utilisateur() {
        return id_utilisateur;
    }
    public void setId_utilisateur(Integer id_utilisateur) {
        this.id_utilisateur = id_utilisateur;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getTelephone() {
        return telephone;
    }
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    public String getMot_de_passe() {
        return mot_de_passe;
    }
    public void setMot_de_passe(String mot_de_passe) {
        this.mot_de_passe = mot_de_passe;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getPrenoms() {
        return prenoms;
    }
    public void setPrenoms(String prenoms) {
        this.prenoms = prenoms;
    }
    public String getPhoto() {
        return photo;
    }
    public void setPhoto(String photo) {
        this.photo = photo;
    }
    public String getAdress() {
        return adress;
    }
    public void setAdress(String adress) {
        this.adress = adress;
    }
    public Date getDate_naissance() {
        return date_naissance;
    }
    public void setDate_naissance(Date date_naissance) {
        this.date_naissance = date_naissance;
    }

}
