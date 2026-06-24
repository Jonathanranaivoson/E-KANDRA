package servlet;

import dao.utilisateurDao.UtilisateurDAO;
import model.utilisateur.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            UtilisateurDAO dao = new UtilisateurDAO();

            Utilisateur u = new Utilisateur();

            u.setEmail(request.getParameter("email"));
            u.setTelephone(request.getParameter("telephone"));
            u.setMot_de_passe(request.getParameter("motdepasse"));
            u.setNom(request.getParameter("nom"));
            u.setPrenoms(request.getParameter("prenoms"));
            u.setAdress(request.getParameter("adress"));
            u.setPhoto(request.getParameter("photo"));

            String date = request.getParameter("dateNaissance");

            if (date != null && !date.trim().isEmpty()) {
                u.setDate_naissance(dao.sqlFormatDate(date));
            }

            dao.inserer_utilisateur(u);

            response.sendRedirect("Login.jsp");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}