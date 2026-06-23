package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import exception.AppException;

public class Connexion {

    private static final String URL = "jdbc:postgresql://localhost:5432/";
    private static final String DB_NAME = "E_Kandra";
    private static final String USER = "postgres";
    private static final String PASSWORD = "1234";
    private static final String DRIVER = "org.postgresql.Driver";

    public static Connection getConnection() throws AppException {
        try {
            Class.forName(DRIVER);
            return DriverManager.getConnection(URL + DB_NAME, USER, PASSWORD);
        } catch (Exception e) {
            throw new AppException("Erreur de connexion a la base de donnees", e);
        }
    }
}
