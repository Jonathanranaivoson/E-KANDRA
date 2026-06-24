<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>

    <style>
        body{
            font-family: Arial, sans-serif;
            margin:40px;
        }

        form{
            width:350px;
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

<h2>Connexion</h2>

<%
String erreur = (String) request.getAttribute("erreur");

if(erreur != null){
%>
<p class="erreur"><%= erreur %></p>
<%
}
%>

<form action="login" method="post">

    <input type="email"
           name="email"
           placeholder="Email"
           required>

    <input type="password"
           name="motdepasse"
           placeholder="Mot de passe"
           required>

    <button type="submit">
        Se connecter
    </button>

</form>

<br>

<a href="Register.jsp">
    Créer un compte
</a>

</body>
</html>