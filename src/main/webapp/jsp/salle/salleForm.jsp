<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${salle == null ? 'Ajouter Salle' : 'Modifier Salle'}</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fb;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            flex: 1; /* Ensures the container can stretch when content is small */
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-top: 15px;
            color: #333;
        }

        input[type="number"],
        select {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            background-color: #fdfdfd;
        }

        button {
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

        button:hover {
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

            h1 {
                font-size: 22px;
            }
        }

        /* Ensure footer sticks at the bottom if content is too small */
        footer {
            margin-top: auto; /* Forces footer to stay at the bottom */
            padding: 10px;
            background-color: #3b5998;
            color: white;
            text-align: center;
        }
    </style>
</head>
<body>

<jsp:include page="/jsp/common/header.jsp" />

<div class="container">
    <h1>${salle == null ? 'Ajouter une Salle' : 'Modifier la Salle'}</h1>

    <form action="<c:url value='/salles' />" method="post">
        <input type="hidden" name="action" value="${salle == null ? 'add' : 'update'}" />

        <label for="codesalle">Code Salle</label>
        <input type="number" id="codesalle" name="codesalle"
               value="${salle != null ? salle.codesal : ''}"
        ${salle != null ? 'readonly' : ''} required />

        <label for="designation">Désignation</label>
        <select id="designation" name="designation" required>
            <option value="Libre" ${salle != null && salle.designation == 'Libre' ? 'selected' : ''}>Libre</option>
            <option value="Occuper" ${salle != null && salle.designation == 'Occuper' ? 'selected' : ''}>Occuper</option>
        </select>

        <button type="submit">${salle == null ? 'Ajouter' : 'Mettre à jour'}</button>
    </form>

    <a class="back-link" href="<c:url value='/salles' />">⬅ Retour à la liste des salles</a>
</div>

<jsp:include page="/jsp/common/footer.jsp" />

</body>
</html>
