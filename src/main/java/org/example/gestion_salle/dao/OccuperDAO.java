package org.example.gestion_salle.dao;

import org.example.gestion_salle.model.Occuper;
import org.example.gestion_salle.model.OccuperId;
import org.example.gestion_salle.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.Date;
import java.util.List;

public class OccuperDAO {
    private SessionFactory sessionFactory;

    public OccuperDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // Méthode pour récupérer une occupation par son ID
    public Occuper getOccuper(OccuperId id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Occuper.class, id);
        }
    }
    public Occuper getOccuperByProfAndDate(int codeprof, Date date) {
        try (Session session = sessionFactory.openSession()) {
            Query<Occuper> query = session.createQuery(
                    "FROM Occuper o WHERE o.id.codeprof = :codeprof AND o.id.date = :date", Occuper.class);
            query.setParameter("codeprof", codeprof);
            query.setParameter("date", date);
            return query.uniqueResult();
        }
    }

    public Occuper getOccuperBySalleAndDate(int codesal, Date date) {
        try (Session session = sessionFactory.openSession()) {
            Query<Occuper> query = session.createQuery(
                    "FROM Occuper o WHERE o.id.codesal = :codesal AND o.id.date = :date", Occuper.class);
            query.setParameter("codesal", codesal);
            query.setParameter("date", date);
            return query.uniqueResult();
        }
    }


    public void ajouterOccuper(Occuper occuper) {
        // Ouvrir une session et commencer une transaction
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();

            // Vérifier si une occupation avec les mêmes codesprof, codesal, et date existe déjà
            String hql = "FROM Occuper o WHERE o.id.codeprof = :codeprof AND o.id.codesal = :codesal AND o.id.date = :date";
            Query<Occuper> query = session.createQuery(hql, Occuper.class);
            query.setParameter("codeprof", occuper.getId().getCodeprof());
            query.setParameter("codesal", occuper.getId().getCodesal());
            query.setParameter("date", occuper.getId().getDate());

            // Si l'occupation existe déjà, ne rien faire
            Occuper existingOccuper = query.uniqueResult();

            if (existingOccuper == null) {
                // Sinon, ajouter la nouvelle occupation
                session.save(occuper);
            }

            transaction.commit();  // Commit de la transaction
        } catch (Exception e) {
            // En cas d'erreur, annuler la transaction
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            // Fermer la session
            session.close();
        }
    }


    // Méthode pour supprimer une occupation
    public void supprimerOccuper(Occuper occuper) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.delete(occuper);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // Suppression par OccuperId
    public void supprimerOccuper(OccuperId id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Occuper occuper = session.get(Occuper.class, id);
            if (occuper != null) {
                session.delete(occuper);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // Méthode pour mettre à jour une occupation
    public void modifierOccuper(Occuper occuper) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(occuper);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // Récupérer toutes les occupations
    public List<Occuper> getAllOccupations() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Occuper", Occuper.class).list();
        }
    }

    // Recherche par professeur
    public List<Occuper> rechercherParProf(int codeprof) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Occuper where prof.codeprof = :codeprof", Occuper.class)
                    .setParameter("codeprof", codeprof)
                    .list();
        }
    }

    // Recherche par salle
    public List<Occuper> rechercherParSalle(int codesalle) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Occuper where salle.codesalle = :codesalle", Occuper.class)
                    .setParameter("codesalle", codesalle)
                    .list();
        }
    }
}
