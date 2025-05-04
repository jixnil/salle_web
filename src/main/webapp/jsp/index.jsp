<!-- /webapp/index.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Salles</title>
    <link rel="stylesheet" href="<c:url value='/styles/main.css' />">
    <link rel="stylesheet" href="<c:url value='/styles/responsive.css' />">
</head>
<body>
<jsp:include page="/jsp/common/header.jsp" />

<div class="main-content">
    <h1>Bienvenue dans la gestion des salles et des professeurs</h1>
    <div class="buttons">
        <a href="<c:url value='/profs' />">Voir Professeurs</a>
        <a href="<c:url value='/salles' />">Voir Salles</a>
    </div>
</div>

<jsp:include page="/jsp/common/footer.jsp" />
</body>
</html>
