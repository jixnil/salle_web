<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Détails du professeur</title>
    <style>
        body { font-family: sans-serif; background-color: #e0f2f7; }
        h1 { color: #1976d2; }
        p { margin: 5px 0; }
    </style>
</head>
<body>
<h1>Détails du professeur</h1>
<p><strong>Code :</strong> ${prof.codeprof}</p>
<p><strong>Nom :</strong> ${prof.nom}</p>
<p><strong>Prénom :</strong> ${prof.prenom}</p>
<p><strong>Grade :</strong> ${prof.grade}</p>
</body>
</html>