<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Détails de la salle</title>
    <style>
        body { font-family: sans-serif; background-color: #e0f2f7; }
        h1 { color: #1976d2; }
        table { width: 50%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #bbdefb; padding: 8px; text-align: left; }
        th { background-color: #90caf9; color: white; }
        input[type="text"], input[type="number"] { width: 100%; padding: 8px; margin: 5px 0; box-sizing: border-box; }
        button { background-color: #4caf50; color: white; padding: 10px 15px; border: none; cursor: pointer; }
        button.delete { background-color: #f44336; }
    </style>
</head>
<body>
<h1>Détails de la salle</h1>
<form action="salles" method="post">
    <input type="hidden" name="action" value="${empty salle.codesalle ? 'add' : 'update'}">
    <input type="hidden" name="codesalle" value="${salle.codesalle}">
    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" value="${salle.nom}" required>
    <label for="capacite">Capacité :</label>
    <input type="number" id="capacite" name="capacite" value="${salle.capacite}" required>
    <button type="submit">${empty salle.codesalle ? 'Ajouter' : 'Modifier'}</button>
    <c:if test="${not empty salle.codesalle}">
        <button type="submit" class="delete" name="action" value="delete">Supprimer</button>
    </c:if>
</form>
<a href="salles?action=list">Retour à la liste</a>
<a href="salles?action=view">Ajouter une salle</a>
</body>
</html>