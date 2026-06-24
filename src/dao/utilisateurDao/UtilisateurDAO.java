package dao.utilisateurDao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Vector;

import model.utilisateur.Utilisateur;
import utils.Connexion;

public class UtilisateurDAO {
    Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Vector tout_utilisateurs() throws Exception {
        Vector list = new Vector();
        String sql = """
                    SELECT id_utilisateur, email, telephone, mot_de_passe, nom, prenoms, photo, adress, date_naissance
                    FROM utilisateur ORDER BY id_utilisateur
                """;

        try (Connection c = Connexion.getConnection();
                PreparedStatement ps = c.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Utilisateur utilisateur = new Utilisateur();
                utilisateur.setId_utilisateur(rs.getInt("id_utilisateur"));
                utilisateur.setEmail(rs.getString("email"));
                utilisateur.setTelephone(rs.getString("telephone"));
                utilisateur.setMot_de_passe(rs.getString("mot_de_passe"));
                utilisateur.setNom(rs.getString("nom"));
                utilisateur.setPrenoms(rs.getString("prenoms"));
                utilisateur.setPhoto(rs.getString("photo"));
                utilisateur.setAdress(rs.getString("adress"));
                utilisateur.setDate_naissance(rs.getDate("date_naissance"));
                list.add(utilisateur);
            }
        }
        return list;
    }

    public Utilisateur utilisateur_par_id(Integer id) throws Exception {
        Utilisateur utilisateur = new Utilisateur();
        String sql = """
                    SELECT id_utilisateur, email, telephone, mot_de_passe, nom, prenoms, photo, adress, date_naissance
                    FROM utilisateur Where id_utilisateur = ?
                """;

        try (Connection c = Connexion.getConnection();
                PreparedStatement ps = c.prepareStatement(sql);) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    utilisateur.setId_utilisateur(rs.getInt("id_utilisateur"));
                    utilisateur.setEmail(rs.getString("email"));
                    utilisateur.setTelephone(rs.getString("telephone"));
                    utilisateur.setMot_de_passe(rs.getString("mot_de_passe"));
                    utilisateur.setNom(rs.getString("nom"));
                    utilisateur.setPrenoms(rs.getString("prenoms"));
                    utilisateur.setPhoto(rs.getString("photo"));
                    utilisateur.setAdress(rs.getString("adress"));
                    utilisateur.setDate_naissance(rs.getDate("date_naissance"));
                }

            }

        }
        return utilisateur;
    }

    public void inserer_utilisateur(Utilisateur utilisateur) throws Exception {
        String sql = """
                    INSERT INTO utilisateur (email, telephone, mot_de_passe, nom, prenoms, photo, adress, date_naissance)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                """;
        try (Connection c = Connexion.getConnection();
                PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, utilisateur.getEmail());
            ps.setString(2, utilisateur.getTelephone());
            ps.setString(3, utilisateur.getMot_de_passe());
            ps.setString(4, utilisateur.getNom());
            ps.setString(5, utilisateur.getPrenoms());
            ps.setString(6, utilisateur.getPhoto());
            ps.setString(7, utilisateur.getAdress());
            ps.setDate(8, utilisateur.getDate_naissance());

            ps.executeUpdate();
        }
    }

    public Boolean authentification_utilisateur(String teste_mdp, String teste_email) throws Exception {
        Boolean resultat = false;
        String sql = """
                    SELECT id_utilisateur, email, mot_de_passe
                    FROM utilisateur ORDER BY id_utilisateur
                """;

        try (Connection c = Connexion.getConnection();
                PreparedStatement ps = c.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            String mot_de_passe = null;
            String email = null;

            while (rs.next()) {
                email = rs.getString("email");
                mot_de_passe = rs.getString("mot_de_passe");

                if (teste_email.equals(email) && teste_mdp.equals(mot_de_passe)) {
                    setId(rs.getInt("id_utilisateur"));
                    resultat = true;
                    break;
                }
            }
        }

        return resultat;
    }

    public Integer id_utilisateur_authentifier(String teste_mdp, String teste_email) throws Exception {
        Integer resultat = null;

        if (authentification_utilisateur(teste_mdp, teste_email)) {
            resultat = getId();
        }
        return resultat;
    }

    public Date sqlFormatDate(String date) {

        Date resultat = null;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date utilDate = format.parse(date);
            resultat = new java.sql.Date(utilDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return resultat;
    }

}
