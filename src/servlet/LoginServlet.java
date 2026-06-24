package servlet;

import dao.utilisateurDao.UtilisateurDAO;
import model.utilisateur.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String email = request.getParameter("email");
            String motdepasse = request.getParameter("motdepasse");

            UtilisateurDAO dao = new UtilisateurDAO();

            boolean authentifie =
                    dao.authentification_utilisateur(
                            motdepasse,
                            email);

            if (authentifie) {

                Integer id =
                        dao.id_utilisateur_authentifier(
                                motdepasse,
                                email);

                Utilisateur utilisateur =
                        dao.utilisateur_par_id(id);

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "utilisateur",
                        utilisateur);

                response.sendRedirect("index.jsp");

            } else {

                request.setAttribute(
                        "erreur",
                        "Email ou mot de passe incorrect");

                request.getRequestDispatcher("Login.jsp")
                        .forward(request, response);
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}