package org.example.gestion_salle.service;

import org.example.gestion_salle.dao.ProfDAO;
import org.example.gestion_salle.model.Prof;

import java.util.List;

public class ProfService {
    private ProfDAO profDAO;

    public ProfService(ProfDAO profDAO) {
        this.profDAO = profDAO;
    }

    public Prof getProf(int codeprof) {
        return profDAO.getProf(codeprof);
    }

    public void ajouterProf(Prof prof) {
        profDAO.ajouterProf(prof);
    }

    public void modifierProf(Prof prof) {
        profDAO.modifierProf(prof);
    }

    public void supprimerProf(int codeprof) throws Exception {
        if (isProfAssignedToRoom(codeprof)) {
            throw new Exception("Le professeur ne peut pas être supprimé car il occupe une salle.");
        }
        Prof prof = profDAO.getProf(codeprof);
        if (prof != null) {
            profDAO.supprimerProf(codeprof);
        }
    }
    private boolean isProfAssignedToRoom(int codeprof) {
        // Implémenter la logique qui vérifie si le professeur est affecté à une salle
        // Par exemple, vérifier dans la base de données si ce professeur est lié à une salle.
        return profDAO.isAssignedToRoom(codeprof);
    }

    public List<Prof> getAllProfs() {
        return profDAO.getAllProfs();
    }
    public List<Integer> getAllProfCodes() {
        return profDAO.getAllProfCodes();
    }

    public List<Prof> rechercherProfs(String recherche) {
        return profDAO.rechercherProfs(recherche);
    }
}
