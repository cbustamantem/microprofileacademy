/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.dao;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author 
 */
 
public interface GenericDao<T,K extends Serializable> {
    /***
     * Add Entity
     * @param entity
     * @return 
     */
T add (T entity);
/***
 * Update Entity
 * @param entity
 * @return 
 */
T update (T entity);
void delete (T entity);
T getById (K key);        
List<T> getAll();


}
    

