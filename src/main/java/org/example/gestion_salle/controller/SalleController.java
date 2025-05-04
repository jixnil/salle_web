package org.example.gestion_salle.controller;

import org.example.gestion_salle.dao.SalleDAO;
import org.example.gestion_salle.model.Salle;
import org.example.gestion_salle.service.SalleService;
import org.example.gestion_salle.utils.HibernateUtil;
import org.hibernate.SessionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/salles")
public class SalleController extends HttpServlet {
    private SalleService salleService;

    @Override
    public void init() throws ServletException {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        SalleDAO salleDAO = new SalleDAO(sessionFactory);
        salleService = new SalleService(salleDAO);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if ("list".equals(action)) {
                List<Salle> salles = salleService.getAllSalles();
                req.setAttribute("salles", salles);
                req.getRequestDispatcher("/jsp/salle/salleList.jsp").forward(req, resp);

            } else if ("view".equals(action)) {
                int codesalle = Integer.parseInt(req.getParameter("codesalle"));
                Salle salle = salleService.getSalle(codesalle);
                req.setAttribute("salle", salle);
                req.getRequestDispatcher("/jsp/salle/salleForm.jsp").forward(req, resp); // Rediriger vers le formulaire de modification

            }  else {
                resp.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Erreur : " + e.getMessage());
            req.getRequestDispatcher("/jsp/common/errors.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if ("add".equals(action)) {
                int codesalle = Integer.parseInt(req.getParameter("codesalle"));
                String designation = req.getParameter("designation");
                Salle salle = new Salle(codesalle, designation);
                salleService.ajouterSalle(salle);

            } else if ("update".equals(action)) {
                int codesalle = Integer.parseInt(req.getParameter("codesalle"));
                String designation = req.getParameter("designation");

                Salle salle = salleService.getSalle(codesalle);
                salle.setDesignation(designation);
                salleService.modifierSalle(salle);

            } else if ("delete".equals(action)) {
                int codesalle = Integer.parseInt(req.getParameter("codesalle"));
                try {
                    salleService.supprimerSalle(codesalle);
                } catch (Exception e) {
                    // Si une exception est levée, on redirige vers la liste avec le message d'erreur
                    resp.sendRedirect("salles?action=list&error=" + e.getMessage());
                    return;
                }
            }

            resp.sendRedirect("salles?action=list");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Erreur : " + e.getMessage());
            req.getRequestDispatcher("/jsp/common/errors.jsp").forward(req, resp);
        }
    }

}

