/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.materia.boundary;

import business.dao.GenericImpl;
import business.materia.entities.Materia;
import jakarta.enterprise.context.ApplicationScoped;

/**
 *
 * @author cbustamante
 */
@ApplicationScoped
public class MateriaManager extends GenericImpl<Materia, Integer> {
    
}