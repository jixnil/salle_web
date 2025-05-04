<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des occupations</title>
    <style>
        /* Global Styles */
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

        /* Table Styles */
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

        /* Responsive Styles */
        @media (max-width: 768px) {
            th, td {
                font-size: 14px;
                padding: 10px;
            }

            .btn-ajouter {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>

<jsp:include page="/jsp/common/header.jsp" />

<div class="content">
    <h2>Liste des occupations</h2>

    <a href="occupations?action=add">➕ Ajouter une occupation</a>

    <c:if test="${not empty occupations}">
        <table>
            <thead>
            <tr>
                <th>Code Professeur</th>
                <th>Code Salle</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="occuper" items="${occupations}">
                <tr>
                    <td>${occuper.id.codeprof}</td>
                    <td>${occuper.id.codesal}</td>
                    <td>${occuper.id.date}</td>
                    <td>
                        <a href="occupations?action=update&codeprof=${occuper.id.codeprof}&codesal=${occuper.id.codesal}&date=${occuper.id.date}">Modifier</a>
                        <a href="occupations?action=delete&codeprof=${occuper.id.codeprof}&codesal=${occuper.id.codesal}&date=${occuper.id.date}" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette occupation ?');">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty occupations}">
        <p>Aucune occupation trouvée.</p>
    </c:if>
</div>

<jsp:include page="/jsp/common/footer.jsp" />
</body>
</html>
