/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.materia.entities;

import business.profesor.entities.Profesor;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author cbustamante
 */
@Entity
@Table(name = "materia")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Materia.findAll", query = "SELECT m FROM Materia m"),
    @NamedQuery(name = "Materia.findById", query = "SELECT m FROM Materia m WHERE m.id = :id"),
    @NamedQuery(name = "Materia.findByDescripcion", query = "SELECT m FROM Materia m WHERE m.descripcion = :descripcion")})
public class Materia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "descripcion")
    private String descripcion;
    @JoinTable(name = "profesor_materia", joinColumns = {
        @JoinColumn(name = "materia", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "profesor", referencedColumnName = "id")})
    @ManyToMany
    private List<Profesor> profesorList;

    public Materia() {
    }

    public Materia(Integer id) {
        this.id = id;
    }

    public Materia(Integer id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
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

    @XmlTransient
    public List<Profesor> getProfesorList() {
        return profesorList;
    }

    public void setProfesorList(List<Profesor> profesorList) {
        this.profesorList = profesorList;
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
        if (!(object instanceof Materia)) {
            return false;
        }
        Materia other = (Materia) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "business.personas.entities.Materia[ id=" + id + " ]";
    }
    
}
