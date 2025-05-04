<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des occupations</title>
    <style>
        body { font-family: sans-serif; background-color: #e0f2f7; }
        h1 { color: #1976d2; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #bbdefb; padding: 8px; text-align: left; }
        th { background-color: #90caf9; color: white; }
        tr:nth-child(even) { background-color: #b3e5fc; }
    </style>
</head>
<body>
<h1>Liste des occupations</h1>
<table>
    <thead>
    <tr>
        <th>Professeur</th>
        <th>Salle</th>
        <th>Date</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${occupations}" var="occupation">
        <tr>
            <td>${occupation.prof.nom} ${occupation.prof.prenom}</td>
            <td>${occupation.salle.nom}</td>
            <td>${occupation.date}</td>
            <td>
                <a href="occupations?action=view&codeprof=${occupation.id.codeprof}&codesal=${occupation.id.codesal}">Modifier</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="occupations?action=view">Ajouter une occupation</a>
</body>
</html>