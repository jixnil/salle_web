package org.example.gestion_salle.service;

import org.example.gestion_salle.dao.OccuperDAO;
import org.example.gestion_salle.model.Occuper;
import org.example.gestion_salle.model.OccuperId;

import java.util.Date;
import java.util.List;

public class OccuperService {
    private final OccuperDAO occuperDAO;

    public OccuperService(OccuperDAO occuperDAO) {
        this.occuperDAO = occuperDAO;
    }

    public Occuper getOccuper(OccuperId id) {
        return occuperDAO.getOccuper(id);
    }

    public void ajouterOccuper(Occuper occuper) {
        occuperDAO.ajouterOccuper(occuper);
    }

    public void supprimerOccuper(Occuper occuper) {
        occuperDAO.supprimerOccuper(occuper);
    }

    public void supprimerOccuper(OccuperId id) {
        Occuper occuper = occuperDAO.getOccuper(id);
        if (occuper != null) {
            occuperDAO.supprimerOccuper(occuper);
        }
    }

    public void updateOccuper(Occuper occuper) {
        occuperDAO.modifierOccuper(occuper);  // Supposons que cette méthode existe dans le DAO
    }

    public List<Occuper> getAllOccupations() {
        return occuperDAO.getAllOccupations();
    }

    public List<Occuper> rechercherParProf(int codeprof) {
        return occuperDAO.rechercherParProf(codeprof);
    }

    public List<Occuper> rechercherParSalle(int codesalle) {
        return occuperDAO.rechercherParSalle(codesalle);
    }

    public boolean isProfAlreadyOccupied(int codeprof, Date date) {
        // Vérifie si le professeur est déjà affecté à une salle à la même date
        Occuper existingOccuper = occuperDAO.getOccuperByProfAndDate(codeprof, date);
        return existingOccuper != null;
    }

    public boolean isSalleAlreadyOccupied(int codesal, Date date) {
        // Vérifie si la salle est déjà occupée par un autre professeur à la même date
        Occuper existingOccuper = occuperDAO.getOccuperBySalleAndDate(codesal, date);
        return existingOccuper != null;
    }

}
