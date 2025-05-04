<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="fr">
<head>
    <title>Liste des Professeurs</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fb;
        }

        .content {
            padding: 30px;
            max-width: 1200px;
            margin: auto;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        /* Style pour le lien Modifier */
        .btn-modifier {
            color: #3b5998; /* Bleu */
            text-decoration: none;
            font-weight: bold;
        }

        .btn-modifier:hover {
            text-decoration: underline;
        }

        /* Style pour le lien Supprimer */
        .btn-supprimer {
            color: #e74c3c; /* Rouge */
            text-decoration: none;
            font-weight: bold;
        }

        .btn-supprimer:hover {
            text-decoration: underline;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
        }

        th {
            background-color: #3b5998;
            color: white;
            padding: 14px;
            text-align: left;
        }

        td {
            padding: 12px;
            background-color: white;
        }

        tr:nth-child(even) td {
            background-color: #f2f2f2;
        }

        a {
            color: #3b5998;
            text-decoration: none;
            font-weight: bold;
            margin-right: 10px;
        }

        a:hover {
            text-decoration: underline;
        }

        .btn-ajouter {
            display: inline-block;
            margin-top: 20px;
            background-color: #3b5998;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }

        .btn-ajouter:hover {
            background-color: #2e477a;
        }

        /* Formulaire de recherche */
        .search-container {
            text-align: right;
            margin-bottom: 20px;
        }

        .search-container form { /* Cibler spécifiquement le formulaire */
            display: inline-block; /* Pour aligner input et button */
        }

        .search-container input[type="text"] {
            padding: 8px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .search-container button {
            padding: 8px 16px;
            background-color: #3b5998;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .search-container button:hover {
            background-color: #2e477a;
        }

        @media (max-width: 768px) {
            th, td {
                font-size: 14px;
                padding: 10px;
            }

            .btn-ajouter {
                width: 100%;
                text-align: center;
            }

            .search-container form {
                display: block;
                text-align: left;
                margin-bottom: 10px;
            }

            .search-container input[type="text"] {
                width: calc(100% - 20px);
                margin-bottom: 5px;
            }

            .search-container button {
                width: 100%;
            }
        }
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fb;
        }

        .content {
            padding: 30px;
            max-width: 1200px;
            margin: auto;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }
    </style>
    <script>
        // Affichage du message d'alerte (popup)
        function showAlert(message) {
            alert(message);
        }
    </script>
</head>
<body>

<jsp:include page="/jsp/common/header.jsp" />

<div class="content">
    <h2>Liste des Professeurs</h2>

    <c:if test="${not empty successMessage}">
        <script>
            showAlert('${successMessage}');
        </script>
    </c:if>

    <c:if test="${not empty error}">
        <script>
            showAlert('${error}');
        </script>
    </c:if>


    <div class="search-container">
        <form action="${pageContext.request.contextPath}/profs" method="get">
            <input type="hidden" name="action" value="rechercher" />
            <input type="text" name="recherche" placeholder="Rechercher par nom ou code" value="${param.recherche}" />
            <button type="submit">Rechercher</button>
        </form>
    </div>

    <a href="<c:url value='/jsp/prof/profForm.jsp' />">➕ Ajouter un Professeur</a>

    <c:if test="${empty profs && not empty param.recherche}">
        <p>Aucun professeur trouvé correspondant à votre recherche.</p>
    </c:if>

    <table>
        <thead>
        <tr>
            <th>Code Prof</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Grade</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="prof" items="${profs}">
            <tr>
                <td>${prof.codeprof}</td>
                <td>${prof.nom}</td>
                <td>${prof.prenom}</td>
                <td>${prof.grade}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/profs?action=modifier&codeprof=${prof.codeprof}" class="btn-modifier">Modifier</a>
                    <form action="${pageContext.request.contextPath}/profs" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="supprimer">
                        <input type="hidden" name="codeprof" value="${prof.codeprof}">
                        <button type="submit" class="btn-supprimer" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce professeur ?')">Supprimer</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty profs && empty param.recherche}">
        <p>Liste des professeurs vide.</p>
    </c:if>

</div>

<jsp:include page="/jsp/common/footer.jsp" />
</body>

</html>