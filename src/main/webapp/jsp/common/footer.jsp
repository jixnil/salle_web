<!-- /webapp/WEB-INF/jsp/common/footer.jsp -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<footer>
    <style>
        footer {
            background-color: #003366; /* Bleu foncé */
            color: white;
            text-align: center;
            padding: 20px 40px;
            position: relative;
            bottom: 0;
            width: 100%;
            font-size: 1em;
            box-shadow: 0 -4px 6px rgba(0, 0, 0, 0.1); /* Ombre subtile en haut */
        }

        footer p {
            margin: 0;
            font-weight: 400;
        }

        footer a {
            text-decoration: none;
            color: #4dabf7; /* Bleu clair pour les liens */
            transition: color 0.3s;
        }

        footer a:hover {
            color: #ffffff; /* Passage du bleu clair au blanc au survol */
        }

        @media (max-width: 600px) {
            footer {
                font-size: 0.9em;
                padding: 15px 25px;
            }
        }

        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .content {
            flex: 1;
        }
    </style>

    <p>&copy; <%= java.time.Year.now() %> jix Gestion des Salles. Tous droits réservés.</p>
    <!-- Ajout d'un lien pour la politique de confidentialité ou les contacts -->
    <p><a href="privacy-policy.jsp">Politique de confidentialité</a></p>
</footer>
