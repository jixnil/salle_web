package org.example.gestion_salle.service;

import org.example.gestion_salle.dao.SalleDAO;
import org.example.gestion_salle.model.Salle;

import java.util.List;

public class SalleService {
    private SalleDAO salleDAO;

    public SalleService(SalleDAO salleDAO) {
        this.salleDAO = salleDAO;
    }

    public Salle getSalle(int codesalle) {
        return salleDAO.getSalle(codesalle);
    }

    public void ajouterSalle(Salle salle) {
        salleDAO.ajouterSalle(salle);
    }

    public void modifierSalle(Salle salle) {
        salleDAO.modifierSalle(salle);
    }

    public void supprimerSalle(int codesalle) throws Exception {
        Salle salle = salleDAO.getSalle(codesalle);

        if (salle != null) {
            // Vérifie si la salle est occupée
            boolean estOccupee = salleDAO.estSalleOccupee(codesalle);
            if (estOccupee) {
                throw new Exception("Impossible de supprimer : cette salle est occupée.");
            }

            salleDAO.supprimerSalle(salle);
        }
    }

    public List<Salle> getAllSalles() {
        return salleDAO.getAllSalles();
    }
    public List<Integer> getAllSalleCodes() {
        return salleDAO.getAllSalleCodes();
    }
}
