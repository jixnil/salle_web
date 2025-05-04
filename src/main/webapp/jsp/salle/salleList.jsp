<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="fr">
<head>
    <title>Liste des Salles</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
        }
        .btn-supprimer {
            color: #e74c3c; /* Rouge */
            text-decoration: none;
            font-weight: bold;
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
    <c:if test="${not empty param.error}">
        <script type="text/javascript">
            alert("${param.error}");
        </script>
    </c:if>
</head>
<body>

<jsp:include page="/jsp/common/header.jsp" />

<div class="content">
    <h2>Liste des Salles</h2>
    <a href="<c:url value='/jsp/salle/salleForm.jsp' />">➕ Ajouter une Salle</a>

    <c:if test="${not empty salles}">
        <table>
            <thead>
            <tr>
                <th>Code Salle</th>
                <th>Désignation</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="salle" items="${salles}">
                <tr>
                    <td>${salle.codesal}</td>
                    <td>${salle.designation}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/salles?action=view&codesalle=${salle.codesal}">Modifier</a>

                        <form action="${pageContext.request.contextPath}/salles" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete" />
                            <input type="hidden" name="codesalle" value="${salle.codesal}" />
                            <input type="submit" value="Supprimer" class="btn-supprimer" onclick="return confirm('Supprimer cette salle ?');" />
                        </form>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty salles}">
        <p>Aucune salle trouvée.</p>
    </c:if>
</div>

<jsp:include page="/jsp/common/footer.jsp" />
</body>
</html>
