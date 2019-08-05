/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.clase.entities;

import business.inscripcion.entities.Estado;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author cbustamante
 */
@Entity
@Table(name = "clase")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Clase.findAll", query = "SELECT c FROM Clase c"),
    @NamedQuery(name = "Clase.findById", query = "SELECT c FROM Clase c WHERE c.id = :id"),
    @NamedQuery(name = "Clase.findByDescripcion", query = "SELECT c FROM Clase c WHERE c.descripcion = :descripcion"),
    @NamedQuery(name = "Clase.findByFecha", query = "SELECT c FROM Clase c WHERE c.fecha = :fecha"),
    @NamedQuery(name = "Clase.findByHoraInicio", query = "SELECT c FROM Clase c WHERE c.horaInicio = :horaInicio"),
    @NamedQuery(name = "Clase.findByHoraFin", query = "SELECT c FROM Clase c WHERE c.horaFin = :horaFin"),
    @NamedQuery(name = "Clase.findByCapacidad", query = "SELECT c FROM Clase c WHERE c.capacidad = :capacidad"),
    @NamedQuery(name = "Clase.findByMateriaId", query = "SELECT c FROM Clase c WHERE c.materiaId = :materiaId"),
    @NamedQuery(name = "Clase.findByProfesorId", query = "SELECT c FROM Clase c WHERE c.profesorId = :profesorId")})
public class Clase implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 45)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Basic(optional = false)
    @NotNull
    @Column(name = "hora_inicio")
    @Temporal(TemporalType.TIME)
    private Date horaInicio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "hora_fin")
    @Temporal(TemporalType.TIME)
    private Date horaFin;
    @Column(name = "capacidad")
    private Integer capacidad;
    @Column(name = "materia_id")
    private Integer materiaId;
    @Column(name = "profesor_id")
    private Integer profesorId;    
    @JoinColumn(name = "estado", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Estado estado;

    public Clase() {
    }

    public Clase(Integer id) {
        this.id = id;
    }

    public Clase(Integer id, Date fecha, Date horaInicio, Date horaFin) {
        this.id = id;
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Date getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Date horaFin) {
        this.horaFin = horaFin;
    }

    public Integer getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(Integer capacidad) {
        this.capacidad = capacidad;
    }

    public Integer getMateriaId() {
        return materiaId;
    }

    public void setMateriaId(Integer materiaId) {
        this.materiaId = materiaId;
    }

    public Integer getProfesorId() {
        return profesorId;
    }

    public void setProfesorId(Integer profesorId) {
        this.profesorId = profesorId;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Clase)) {
            return false;
        }
        Clase other = (Clase) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "business.personas.entities.Clase[ id=" + id + " ]";
    }
    
}
