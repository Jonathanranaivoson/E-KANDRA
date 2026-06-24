<%@ page import="model.utilisateur.Utilisateur" %>

<%
Utilisateur user =
    (Utilisateur) session.getAttribute("utilisateur");

if(user == null){
    response.sendRedirect("Login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accueil</title>
</head>
<body>

<h2>
    Bienvenue
    <%= user.getNom() %>
    <%= user.getPrenoms() %>
</h2>

<p>Email : <%= user.getEmail() %></p>
<p>Téléphone : <%= user.getTelephone() %></p>

<a href="logout">
    Déconnexion
</a>

</body>
</html>