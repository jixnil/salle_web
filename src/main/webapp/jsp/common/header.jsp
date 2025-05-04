<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des salles de classe</title>
    <style>
        /* Header personnalisé avec palette de bleus */
        header {
            background-color: #0066cc; /* Bleu principal */
            color: white;
            padding: 15px 30px;
            position: sticky;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Ombre subtile */
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }

        nav ul li {
            margin: 0 20px;
        }

        nav ul li a {
            text-decoration: none;
            color: #ffffff;
            font-weight: 600;
            font-size: 18px;
            padding: 10px 18px;
            border-radius: 8px;
            transition: background-color 0.3s, transform 0.3s;
        }

        nav ul li a:hover {
            background-color: #004c99; /* Bleu plus foncé au survol */
            color: #e0e0e0; /* Gris clair */
            transform: translateY(-3px); /* Effet léger de survol */
        }

        nav ul li a:active {
            background-color: #003366; /* Bleu encore plus foncé lors du clic */
        }

        @media (max-width: 600px) {
            nav ul {
                flex-direction: column;
            }

            nav ul li {
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>

<!-- Navigation -->
<header>
    <nav>
        <ul>
            <li><a href="profs?action=list">Professeurs</a></li>
            <li><a href="salles?action=list">Salles</a></li>
            <li><a href="occupations?action=list">Occupations</a></li>
        </ul>
    </nav>
</header>

</body>
</html>
