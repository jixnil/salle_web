<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>${empty occupation ? 'Ajouter' : 'Modifier'} une occupation</title>
    <style>
        body { font-family: sans-serif; background-color: #e0f2f7; }
        h1 { color: #1976d2; }
        form { width: 50%; margin-top: 20px; }
        label { display: block; margin-bottom: 5px; }
        select, input[type="date"] { width: 100%; padding: 8px; margin-bottom: 10px; box-sizing: border-box; }
        button { background-color: #4caf50; color: white; padding: 10px 15px; border: none; cursor: pointer; }
        button.delete { background-color: #f44336; }
    </style>
</head>
<body>
<h1>${empty occupation ? 'Ajouter' : 'Modifier'} une occupation</h1>
<form action="occupations" method="post">
    <input type="hidden" name="action" value="${empty occupation ? 'add' : 'update'}">
    <c:if test="${not empty occupation}">
        <input type="hidden" name="codeprof" value="${occupation.id.codeprof}">
        <input type="hidden" name="codesal" value="${occupation.id.codesal}">
    </c:if>
    <label for="codeprof">Professeur :</label>
    <select name="codeprof" id="codeprof">
        <c:forEach items="${profs}" var="prof">
            <option value="${prof.codeprof}" ${occupation.prof.codeprof == prof.codeprof ? 'selected' : ''}>${prof.nom} ${prof.prenom}</option>
        </c:forEach>
    </select>
    <label for="codesal">Salle :</label>
    <select name="codesal" id="codesal">
        <c:forEach items="${salles}" var="salle">
            <option value="${salle.codesalle}" ${occupation.salle.codesalle == salle.codesalle ? 'selected' : ''}>${salle.nom}</option>
        </c:forEach>
    </select>
    <label for="date">Date :</label>
    <input type="date" name="date" id="date" value="<fmt:formatDate value="${occupation.date}" pattern="yyyy-MM-dd"/>">
    <button type="submit">${empty occupation ? 'Ajouter' : 'Modifier'}</button>
    <c:if test="${not empty occupation}">
        <button type="submit" class="delete" name="action" value="delete">Supprimer</button>
    </c:if>
</form>
<a href="occupations?action=list">Retour à la liste</a>
</body>
</html>