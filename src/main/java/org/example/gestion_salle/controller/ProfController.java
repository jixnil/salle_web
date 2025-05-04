package org.example.gestion_salle.controller;

import org.example.gestion_salle.model.Prof;
import org.example.gestion_salle.service.ProfService;
import org.example.gestion_salle.utils.HibernateUtil;
import org.example.gestion_salle.dao.ProfDAO;
import org.hibernate.SessionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/profs")
public class ProfController extends HttpServlet {
    private ProfService profService;

    @Override
    public void init() throws ServletException {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        ProfDAO profDAO = new ProfDAO(sessionFactory);
        profService = new ProfService(profDAO);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if ("view".equalsIgnoreCase(action)) {
                int codeprof = Integer.parseInt(req.getParameter("codeprof"));
                Prof prof = profService.getProf(codeprof);
                req.setAttribute("prof", prof);
                req.getRequestDispatcher("/jsp/prof/profDetails.jsp").forward(req, resp);

            } else if ("rechercher".equalsIgnoreCase(action)) {
                String recherche = req.getParameter("recherche");
                List<Prof> profs;
                if (recherche != null && !recherche.trim().isEmpty()) {
                    profs = profService.rechercherProfs(recherche);
                } else {
                    profs = profService.getAllProfs();
                }
                req.setAttribute("profs", profs);
                req.getRequestDispatcher("/jsp/prof/profList.jsp").forward(req, resp);

            } else if ("ajouter".equalsIgnoreCase(action)) {
                req.getRequestDispatcher("/jsp/prof/profForm.jsp").forward(req, resp);

            } else if ("modifier".equalsIgnoreCase(action)) {
                int codeprof = Integer.parseInt(req.getParameter("codeprof"));
                Prof prof = profService.getProf(codeprof);
                req.setAttribute("prof", prof);
                req.getRequestDispatcher("/jsp/prof/profForm.jsp").forward(req, resp);

            } else if ("supprimer".equalsIgnoreCase(action)) {
                int codeprof = Integer.parseInt(req.getParameter("codeprof"));
                try {
                    profService.supprimerProf(codeprof);
                } catch (Exception e) {
                    req.setAttribute("error", e.getMessage());
                }

                // Recharger la liste dans tous les cas
                List<Prof> profs = profService.getAllProfs();
                req.setAttribute("profs", profs);
                req.getRequestDispatcher("/jsp/prof/profList.jsp").forward(req, resp);

            } else {
                List<Prof> profs = profService.getAllProfs();
                req.setAttribute("profs", profs);
                req.getRequestDispatcher("/jsp/prof/profList.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            req.setAttribute("error", "Erreur : " + e.getMessage());
            req.getRequestDispatcher("/jsp/common/errors.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if ("ajouter".equalsIgnoreCase(action)) {
                int codeprof = Integer.parseInt(req.getParameter("codeprof"));
                String nom = req.getParameter("nom");
                String prenom = req.getParameter("prenom");
                String grade = req.getParameter("grade");

                Prof prof = new Prof();
                prof.setCodeprof(codeprof);
                prof.setNom(nom);
                prof.setPrenom(prenom);
                prof.setGrade(grade);
                profService.ajouterProf(prof);

            } else if ("modifier".equalsIgnoreCase(action)) {
                int codeprof = Integer.parseInt(req.getParameter("codeprof"));
                String nom = req.getParameter("nom");
                String prenom = req.getParameter("prenom");
                String grade = req.getParameter("grade");

                Prof prof = profService.getProf(codeprof);
                if (prof != null) {
                    prof.setNom(nom);
                    prof.setPrenom(prenom);
                    prof.setGrade(grade);
                    profService.modifierProf(prof);
                }

            } else if ("supprimer".equalsIgnoreCase(action)) {
                int codeprof = Integer.parseInt(req.getParameter("codeprof"));
                try {
                    profService.supprimerProf(codeprof);
                } catch (Exception e) {
                    req.setAttribute("error", e.getMessage());
                }

                // Toujours afficher la liste, même après erreur
                List<Prof> profs = profService.getAllProfs();
                req.setAttribute("profs", profs);
                req.getRequestDispatcher("/jsp/prof/profList.jsp").forward(req, resp);
                return;
            }

            // Redirection vers la liste après toute autre opération
            resp.sendRedirect(req.getContextPath() + "/profs?action=list");

        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            List<Prof> profs = profService.getAllProfs();
            req.setAttribute("profs", profs);
            req.getRequestDispatcher("/jsp/prof/profList.jsp").forward(req, resp);
        }
    }
}
