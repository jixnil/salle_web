package org.example.gestion_salle.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

@Embeddable
public class OccuperId implements Serializable {
    @Column(name = "codeprof")
    private int codeprof;

    @Column(name = "codesal")
    private int codesal;

    @Temporal(TemporalType.DATE)
    @Column(name = "date")
    private Date date;

    public OccuperId() {}

    public OccuperId(int codeprof, int codesal, Date date) {
        this.codeprof = codeprof;
        this.codesal = codesal;
        this.date = date;
    }

    // Getters et setters
    public int getCodeprof() {
        return codeprof;
    }

    public void setCodeprof(int codeprof) {
        this.codeprof = codeprof;
    }

    public int getCodesal() {
        return codesal;
    }

    public void setCodesal(int codesal) {
        this.codesal = codesal;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    // equals et hashCode
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OccuperId occuperId = (OccuperId) o;
        return codeprof == occuperId.codeprof && codesal == occuperId.codesal;
    }

    @Override
    public int hashCode() {
        return Objects.hash(codeprof, codesal);
    }
}
