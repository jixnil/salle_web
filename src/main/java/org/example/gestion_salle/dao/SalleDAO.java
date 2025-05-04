package org.example.gestion_salle.dao;

import org.example.gestion_salle.model.Salle;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class SalleDAO {
    private SessionFactory sessionFactory;

    public SalleDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Salle getSalle(int codesalle) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Salle.class, codesalle);
        }
    }

    public void ajouterSalle(Salle salle) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(salle);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public void supprimerSalle(Salle salle) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.delete(salle);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }
    public boolean estSalleOccupee(int codesalle) {
        try (Session session = sessionFactory.openSession()) {
            Long count = session.createQuery(
                            "SELECT COUNT(o) FROM Occuper o WHERE o.salle.codesalle = :codesalle", Long.class)
                    .setParameter("codesalle", codesalle)
                    .uniqueResult();
            return count != null && count > 0;
        }
    }


    public void supprimerSalle(int codesalle) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Salle salle = session.get(Salle.class, codesalle);
            if (salle != null) {
                session.delete(salle);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public void modifierSalle(Salle salle) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(salle);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public List<Salle> getAllSalles() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Salle", Salle.class).list();
        }
    }

    public List<Integer> getAllSalleCodes() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("SELECT s.codesalle FROM Salle s", Integer.class).list();
        }
    }
}
