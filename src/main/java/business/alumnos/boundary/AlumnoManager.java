/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.alumnos.boundary;

import business.alumnos.entities.Alumno;
import business.dao.GenericImpl;
import business.institucion.boundary.InstitucionManager;
import business.institucion.entities.Institucion;
import business.personas.entities.Persona;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import business.utils.UtilLogger;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;

/**
 *
 * @author cbustamante
 */
@ApplicationScoped
public class AlumnoManager extends GenericImpl<Alumno, Integer>  {
   
    @Inject
    InstitucionManager institucionMgr;


    @Override
    protected String getEntityName() {
        return "Alumno";
    }


 public Alumno addAlumnoFromService(String nombre, String apellido, String email, String documento, Character sexo, Date fechaNac, String telefono, String direccion) {
        Alumno alumno = new Alumno();
        Persona persona = new Persona();
        persona.setNombre(nombre);
        persona.setApellido(apellido);
        persona.setEmail(email);
        persona.setDocumento(documento);
        persona.setSexo(sexo);
        persona.setFechaNac(fechaNac);
        persona.setTelefono(telefono);
        persona.setDireccion(direccion);
        alumno.setPersona(persona);
        alumno.setInstitucion(institucionMgr.getById(1));                
        return add(alumno);
               
    }
    
}
