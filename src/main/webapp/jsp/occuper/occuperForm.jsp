<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <c:choose>
            <c:when test="${occuper == null}">Ajouter Occupation</c:when>
            <c:otherwise>Modifier Occupation</c:otherwise>
        </c:choose>
    </title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fb;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            color: #333;
            margin-top: 20px;
        }

        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 500px;
            margin-top: 20px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
        }

        select, input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        button {
            background-color: #3b5998;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        button:hover {
            background-color: #2e477a;
        }

        @media (max-width: 600px) {
            form {
                width: 95%;
            }
        }

        /* Style pour les erreurs */
        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<jsp:include page="/jsp/common/header.jsp" />

<div class="content">
    <h1>
        <c:choose>
            <c:when test="${occuper == null}">Ajouter une Occupation</c:when>
            <c:otherwise>Modifier l'Occupation</c:otherwise>
        </c:choose>
    </h1>

    <!-- Affichage du message d'erreur en cas de duplication -->
    <c:if test="${not empty errorMessage}">
        <script type="text/javascript">
            alert("${errorMessage}");
        </script>
    </c:if>

    <form action="<c:url value='/occupations' />" method="POST">
        <input type="hidden" name="action" value="<c:out value='${occuper == null ? "add" : "update"}'/>" />

        <div class="input-group">
            <label for="codeprof">Code Professeur</label>
            <select id="codeprof" name="codeprof" required>
                <c:forEach var="codeprof" items="${profCodes}">
                    <option value="${codeprof}" <c:if test="${occuper != null && occuper.id.codeprof == codeprof}">selected</c:if>>${codeprof}</option>
                </c:forEach>
            </select>
        </div>

        <div class="input-group">
            <label for="codesal">Code Salle</label>
            <select id="codesal" name="codesal" required>
                <c:forEach var="codesal" items="${salleCodes}">
                    <option value="${codesal}" <c:if test="${occuper != null && occuper.id.codesal == codesal}">selected</c:if>>${codesal}</option>
                </c:forEach>
            </select>
        </div>

        <div class="input-group">
            <label for="date">Date d'Occupation</label>
            <input type="date" id="date" name="date"
                   value="<c:out value='${occuper != null ? occuper.id.date : ""}'/>" required />
        </div>

        <button type="submit">
            <c:choose>
                <c:when test="${occuper == null}">Ajouter</c:when>
                <c:otherwise>Mettre à jour</c:otherwise>
            </c:choose>
        </button>
    </form>
</div>

<jsp:include page="/jsp/common/footer.jsp" />
</body>
</html>
