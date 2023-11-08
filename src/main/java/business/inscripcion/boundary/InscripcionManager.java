/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.inscripcion.boundary;

import business.clase.entities.Clase;
import business.dao.GenericImpl;
import business.inscripcion.entities.Inscripcion;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.context.RequestScoped;

/**
 *
 * @author cbustamante
 */
@ApplicationScoped
public class InscripcionManager extends GenericImpl<Inscripcion, Integer> {
    
}
