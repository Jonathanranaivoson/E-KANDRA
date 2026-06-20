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
