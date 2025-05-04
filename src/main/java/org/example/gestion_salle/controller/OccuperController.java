package org.example.gestion_salle.controller;

import org.example.gestion_salle.model.Occuper;
import org.example.gestion_salle.model.OccuperId;
import org.example.gestion_salle.model.Prof;
import org.example.gestion_salle.model.Salle;
import org.example.gestion_salle.service.OccuperService;
import org.example.gestion_salle.service.ProfService;
import org.example.gestion_salle.service.SalleService;
import org.example.gestion_salle.utils.HibernateUtil;
import org.example.gestion_salle.dao.OccuperDAO;
import org.example.gestion_salle.dao.ProfDAO;
import org.example.gestion_salle.dao.SalleDAO;
import org.hibernate.SessionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

@WebServlet("/occupations")
public class OccuperController extends HttpServlet {
    private OccuperService occuperService;
    private ProfService profService;
    private SalleService salleService;

    @Override
    public void init() throws ServletException {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        occuperService = new OccuperService(new OccuperDAO(sessionFactory));
        profService = new ProfService(new ProfDAO(sessionFactory));
        salleService = new SalleService(new SalleDAO(sessionFactory));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("list".equalsIgnoreCase(action)) {
            List<Occuper> occupations = occuperService.getAllOccupations();
            req.setAttribute("occupations", occupations);
            req.getRequestDispatcher("/jsp/occuper/occuperList.jsp").forward(req, resp);

        } else if ("view".equalsIgnoreCase(action) || "update".equalsIgnoreCase(action)) {
            try {
                String codeprofStr = req.getParameter("codeprof");
                String codesalStr = req.getParameter("codesal");
                String dateStr = req.getParameter("date");

                if (codeprofStr == null || codesalStr == null || dateStr == null) {
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Paramètres manquants");
                    return;
                }

                int codeprof = Integer.parseInt(codeprofStr);
                int codesal = Integer.parseInt(codesalStr);
                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);

                OccuperId id = new OccuperId(codeprof, codesal, date);
                Occuper occuper = occuperService.getOccuper(id);

                if (occuper != null) {
                    List<Integer> profCodes = profService.getAllProfCodes();
                    List<Integer> salleCodes = salleService.getAllSalleCodes();

                    req.setAttribute("occuper", occuper);
                    req.setAttribute("profCodes", profCodes);
                    req.setAttribute("salleCodes", salleCodes);
                    req.getRequestDispatcher("/jsp/occuper/occuperForm.jsp").forward(req, resp);
                } else {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Occupation non trouvée");
                }

            } catch (NumberFormatException | ParseException e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Paramètres invalides");
            }
        } else if ("add".equalsIgnoreCase(action)) {
            List<Integer> profCodes = profService.getAllProfCodes();
            List<Integer> salleCodes = salleService.getAllSalleCodes();
            req.setAttribute("profCodes", profCodes);
            req.setAttribute("salleCodes", salleCodes);
            req.getRequestDispatcher("/jsp/occuper/occuperForm.jsp").forward(req, resp);

        } else if ("delete".equalsIgnoreCase(action)) {
            try {
                int codeprof = Integer.parseInt(req.getParameter("codeprof"));
                int codesal = Integer.parseInt(req.getParameter("codesal"));
                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("date"));

                OccuperId id = new OccuperId(codeprof, codesal, date);
                Occuper occuper = occuperService.getOccuper(id);

                if (occuper != null) {
                    occuperService.supprimerOccuper(occuper);
                }

                resp.sendRedirect("occupations?action=list");

            } catch (Exception e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Paramètres invalides pour la suppression");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Action non reconnue");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            int codeprof = Integer.parseInt(req.getParameter("codeprof"));
            int codesal = Integer.parseInt(req.getParameter("codesal"));
            Date date = sdf.parse(req.getParameter("date"));
            OccuperId id = new OccuperId(codeprof, codesal, date);

            // Vérification de la duplication
            if ("add".equalsIgnoreCase(action)) {
                if (occuperService.isProfAlreadyOccupied(codeprof, date)) {
                    req.setAttribute("errorMessage", "Le professeur est déjà occupé à cette date.");
                    req.getRequestDispatcher("/jsp/occuper/occuperForm.jsp").forward(req, resp);
                    return;
                }
                if (occuperService.isSalleAlreadyOccupied(codesal, date)) {
                    req.setAttribute("errorMessage", "La salle est déjà occupée à cette date.");
                    req.getRequestDispatcher("/jsp/occuper/occuperForm.jsp").forward(req, resp);
                    return;
                }

                Prof prof = profService.getProf(codeprof);
                Salle salle = salleService.getSalle(codesal);
                Occuper occuper = new Occuper(id, prof, salle);
                occuperService.ajouterOccuper(occuper);
            } else if ("update".equalsIgnoreCase(action)) {
                Occuper occuper = occuperService.getOccuper(id);
                if (occuper != null) {
                    occuperService.updateOccuper(occuper);
                }
            }

            resp.sendRedirect("occupations?action=list");

        } catch (Exception e) {
            req.setAttribute("errorMessage", e.getMessage());
            req.getRequestDispatcher("/jsp/occuper/occuperForm.jsp").forward(req, resp);
        }
    }


}

