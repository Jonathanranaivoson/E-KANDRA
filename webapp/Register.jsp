<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inscription</title>

    <style>
        body{
            font-family: Arial, sans-serif;
            margin:40px;
        }

        form{
            width:400px;
        }

        input{
            width:100%;
            padding:8px;
            margin-bottom:10px;
        }

        button{
            padding:10px;
        }

        .erreur{
            color:red;
        }
    </style>
</head>
<body>

<h2>Inscription</h2>

<%
String erreur = (String) request.getAttribute("erreur");
if(erreur != null){
%>
<p class="erreur"><%= erreur %></p>
<%
}
%>

<form action="register" method="post">

    <input type="text"
           name="nom"
           placeholder="Nom"
           required>

    <input type="text"
           name="prenoms"
           placeholder="Prénoms"
           required>

    <input type="email"
           name="email"
           placeholder="Email"
           required>

    <input type="text"
           name="telephone"
           placeholder="Téléphone">

    <input type="password"
           name="motdepasse"
           placeholder="Mot de passe"
           required>

    <input type="text"
           name="adress"
           placeholder="Adresse">

    <input type="text"
           name="photo"
           placeholder="Photo (url ou nom fichier)">

    <label>Date de naissance</label>
    <input type="date"
           name="dateNaissance">

    <button type="submit">
        S'inscrire
    </button>

</form>

<br>

<a href="Login.jsp">
    Déjà un compte ? Se connecter
</a>

</body>
</html>