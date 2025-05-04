<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des salles de classe</title>
    <style>
        /* Styles globaux */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f4f8;
            color: #333;
        }

        /* Barre de navigation */
        nav {
            background-color: #007bb5;
            overflow: hidden;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 18px;
        }

        nav a:hover {
            background-color: #005f73;
            color: white;
        }

        /* Section hero */
        .hero {
            background-image: url('images/classroom.jpeg');
            background-size: cover;
            background-position: center;
            height: 60vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }

        .hero h1 {
            font-size: 3em;
            margin: 0;
            text-align: center;
        }

        /* Contenu principal */
        .container {
            width: 80%;
            margin: 50px auto;
            text-align: center;
        }

        p {
            color: #666;
            font-size: 1.2em;
        }

        /* Pied de page */
        footer {
            background-color: #007bb5;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

<!-- Navigation -->
<nav>
    <a href="profs?action=list">Professeurs</a>
    <a href="salles?action=list">Salles</a>
    <a href="occupations?action=list">Occupations</a>
</nav>

<!-- Section Hero -->
<div class="hero">
    <h1>Bienvenue dans la gestion des salles de classe</h1>
</div>

<!-- Contenu Principal -->
<div class="container">
    <p>Utilisez la barre de navigation pour accéder aux différentes sections de l'application.</p>
</div>

<!-- Pied de Page -->
<footer>
    <p>&copy; 2025 Gestion des Salles de Classe</p>
</footer>

</body>
</html>
