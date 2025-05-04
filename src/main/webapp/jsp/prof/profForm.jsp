<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire Professeur</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fb;
            margin: 0;
        }

        .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        form label {
            font-weight: 600;
            display: block;
            margin-top: 15px;
            color: #333;
        }

        form input[type="text"],
        form input[type="number"],
        form select {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            background-color: #fdfdfd;
        }

        form select {
            cursor: pointer;
        }

        button[type="submit"] {
            background-color: #3b5998;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            margin-top: 25px;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #2e477a;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #3b5998;
            text-decoration: none;
            font-weight: 600;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>

<jsp:include page="/jsp/common/header.jsp" />

<div class="container">
    <h2>${prof != null ? "Modifier" : "Ajouter"} un Professeur</h2>

    <form action="<c:url value='/profs' />" method="post">
        <input type="hidden" name="action" value="${prof != null ? 'modifier' : 'ajouter'}"/>
        <c:if test="${prof != null}">
            <input type="hidden" name="codeprof" value="${prof.codeprof}" />
        </c:if>

        <label for="codeprof">Code Professeur :</label>
        <input type="number" name="codeprof" id="codeprof" value="${prof.codeprof}" required ${prof != null ? 'readonly' : ''}/>

        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" value="${prof.nom}" required/>

        <label for="prenom">Prénom :</label>
        <input type="text" id="prenom" name="prenom" value="${prof.prenom}" required/>

        <label for="grade">Grade :</label>
        <select name="grade" id="grade" required>
            <option value="">-- Choisir --</option>
            <c:set var="grades" value="${['Docteur', 'HDR', 'Professeur', 'Maître de conférence']}" />
            <c:forEach var="g" items="${grades}">
                <option value="${g}" ${prof.grade == g ? 'selected' : ''}>${g}</option>
            </c:forEach>
        </select>

        <button type="submit">Valider</button>
    </form>

    <a class="back-link" href="<c:url value='/profs' />">⬅ Retour à la liste des professeurs</a>
</div>

<jsp:include page="/jsp/common/footer.jsp" />

</body>
</html>
