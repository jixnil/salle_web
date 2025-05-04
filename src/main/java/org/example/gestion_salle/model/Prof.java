package org.example.gestion_salle.model;

import javax.persistence.*;

@Entity
@Table(name = "PROF")
public class Prof {

    @Id
    @Column(name = "codeprof")
    private int codeprof;

    @Column(name = "Nom", nullable = false)
    private String nom;

    @Column(name = "Prenom", nullable = false)
    private String prenom;

    @Column(name = "Grade", nullable = false)
    private String grade;

    public Prof() {}

    public Prof(int codeprof, String nom, String prenom, String grade) {
        this.codeprof = codeprof;
        this.nom = nom;
        this.prenom = prenom;
        this.grade = grade;
    }


    // Getters et setters
    public int getCodeprof() {
        return codeprof;
    }

    public void setCodeprof(int codeprof) {
        this.codeprof = codeprof;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }


    @Override
    public String toString() {
        return "Prof{" +
                "codeprof=" + codeprof +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", grade='" + grade + '\'' +
                '}';
    }
}
