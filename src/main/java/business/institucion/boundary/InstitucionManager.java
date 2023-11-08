/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.institucion.boundary;

import business.alumnos.entities.Alumno;
import business.dao.GenericImpl;
import business.institucion.entities.Institucion;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.context.RequestScoped;

/**
 *
 * @author cbustamante
 */
@ApplicationScoped
public class InstitucionManager extends GenericImpl<Institucion, Integer> {
    
}
