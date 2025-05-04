package org.example.gestion_salle.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "OCCUPER")
public class Occuper {
    @EmbeddedId
    private OccuperId id;

    @ManyToOne
    @JoinColumn(name = "codeprof", referencedColumnName = "codeprof", insertable = false, updatable = false)
    private Prof prof;

    @ManyToOne
    @JoinColumn(name = "codesal", referencedColumnName = "codesal", insertable = false, updatable = false)
    private Salle salle;

    // Supprimé : champ 'date' redondant

    // Constructeurs, getters et setters
    public Occuper() {
    }

    public Occuper(OccuperId id, Prof prof, Salle salle) {
        this.id = id;
        this.prof = prof;
        this.salle = salle;
    }

    public OccuperId getId() {
        return id;
    }

    public void setId(OccuperId id) {
        this.id = id;
    }

    public Prof getProf() {
        return prof;
    }

    public void setProf(Prof prof) {
        this.prof = prof;
    }

    public Salle getSalle() {
        return salle;
    }

    public void setSalle(Salle salle) {
        this.salle = salle;
    }
}
