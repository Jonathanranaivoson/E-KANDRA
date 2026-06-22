// package utils;

// import exception.AppException;
// import java.sql.Connection;
// import java.sql.DriverManager;

// public class Connexion {

//     private static final String URL = "jdbc:postgresql://localhost:5432/AppliSakafo";
//     private static final String USER = "postgres"; //raha misy utilisateur postgre dia soloy am inareo
//     private static final String PASSWORD = "jojo"; //raha misy mdp dia soloy ny anareo, raha tsisy dia =''; ihany

//     public static Connection getConnection() throws AppException {
//         try {
//             Class.forName("org.postgresql.Driver");
//             return DriverManager.getConnection(URL, USER, PASSWORD);
//         } catch (Exception e) {
//             throw new AppException("Erreur de connexion a la base de donnees", e);
//         }
//     }
// }
package utils;

import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {

    public static java.sql.Connection getConnection() throws Exception {
        java.sql.Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5432/E_Kandra";
            String user = "postgres";
            String password = "wawa";

            con = DriverManager.getConnection(url, user, password);
            System.out.println("Connexion réussie à la base de données E_Kandra !");
        } catch (ClassNotFoundException e) {
            System.err.println("Driver PostgreSQL introuvable.");
            throw e;
        } catch (SQLException e) {
            System.err.println("Erreur lors de la connexion à la base de données: " + e.getMessage());
            throw e;
        }
        return con;
    }
}