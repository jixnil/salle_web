package org.example.gestion_salle.dao;

import org.example.gestion_salle.model.Prof;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class ProfDAO {
    private final SessionFactory sessionFactory;

    public ProfDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Prof getProf(int codeprof) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Prof.class, codeprof);
        }
    }

    public void ajouterProf(Prof prof) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(prof);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public void modifierProf(Prof prof) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(prof);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }
    public boolean isAssignedToRoom(int codeprof) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "SELECT COUNT(*) FROM Occuper o WHERE o.prof.codeprof = :codeprof";
            Query<Long> query = session.createQuery(hql, Long.class);
            query.setParameter("codeprof", codeprof);

            long count = query.uniqueResult();
            return count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Prof> rechercherProfs(String recherche) {
        System.out.println("ProfDAO - rechercherProfs - Terme de recherche: " + recherche);
        try (Session session = sessionFactory.openSession()) {
            Query<Prof> query = session.createQuery(
                    "FROM Prof WHERE lower(nom) LIKE :recherche OR lower(prenom) LIKE :recherche OR cast(codeprof as string) LIKE :recherche",
                    Prof.class
            );
            query.setParameter("recherche", "%" + recherche.toLowerCase() + "%");
            System.out.println("ProfDAO - rechercherProfs - Requête HQL: " + query.getQueryString());
            List<Prof> profs = query.list();
            System.out.println("ProfDAO - rechercherProfs - Nombre de résultats: " + profs.size());
            return profs;
        }
    }

    public void supprimerProf(int codeprof) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Prof prof = session.get(Prof.class, codeprof);
            if (prof != null) {
                session.delete(prof);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }


    public List<Prof> getAllProfs() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Prof", Prof.class).list();
        }
    }

    public List<Integer> getAllProfCodes() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("SELECT p.codeprof FROM Prof p", Integer.class).list();
        }
    }

}
