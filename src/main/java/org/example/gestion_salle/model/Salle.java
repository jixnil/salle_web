package org.example.gestion_salle.model;

import javax.persistence.*;

@Entity
@Table(name = "SALLE")
public class Salle {

    @Id
    @Column(name = "codesal")
    private int codesalle;

    @Column(name = "Designation", nullable = false)
    private String designation;

    public Salle() {
    }

    public Salle(int codesalle, String designation) {
        this.codesalle = codesalle;
        this.setDesignation(designation); // validation ici
    }

    public int getCodesal() {
        return codesalle;
    }

    public void setCodesal(int codesal) {
        this.codesalle = codesal;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        if (!designation.equalsIgnoreCase("Libre") && !designation.equalsIgnoreCase("Occuper")) {
            throw new IllegalArgumentException("La désignation doit être 'Libre' ou 'Occuper'");
        }
        this.designation = designation;
    }

    @Override
    public String toString() {
        return "Salle{" +
                "codesal=" + codesalle +
                ", designation='" + designation + '\'' +
                '}';
    }
}
