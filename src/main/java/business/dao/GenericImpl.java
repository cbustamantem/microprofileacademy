/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.dao;

import business.dao.GenericDao;
import business.utils.UtilLogger;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Collections;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templtes
 * and open the template in the editor.
 */
/**
 *
 * @author cbustamante
 * @param <ET>
 * @param <PK>
 */
public class GenericImpl<ET, PK extends Serializable>
    implements GenericDao<ET, PK> {
   
    
    @PersistenceContext
    protected EntityManager em;

    @Override
    public ET add(ET entity) {
        try {
            em.persist(entity);
            return entity;
        } catch (Exception ex) {
            UtilLogger.error(getEntityName() + ".add", ex);
            return null;
        }
    }

    @Override
    public ET update(ET entity) {
        try {
            em.merge(entity);
            return entity;
        } catch (Exception ex) {
            UtilLogger.error(getEntityName() + ".update", ex);
            return null;
        }
    }

    @Override
    public ET getById(PK key) {
        try {
            //findByPersonalId
            Query query = em.createNamedQuery(getEntityName()  + ".findById").setParameter("id", key);
            return ((ET) query.getSingleResult());
        } catch (Exception e) {
            UtilLogger.error(getEntityName() + ".getById", e);
            return null;
        }
    }

    @Override
    public List<ET> getAll() {
        try {
            
            UtilLogger.info("GetAll >" + getEntityName() + ".findAll");
            return (List<ET>) em.createNamedQuery(getEntityName() + ".findAll").getResultList();
        } catch (Exception ex) {
            UtilLogger.error(getEntityName() + ".getAll", ex);
            return Collections.EMPTY_LIST;
        }
    }

    @Override
    public void delete(ET entity) {
        try {
            em.remove(entity);
        } catch (Exception e) {
            UtilLogger.error(this.getClass().getName() + ".update", e);
        }
    }

    private String getEntityName() {
        
        return this.getGenericName().replace("Manager", "");
    }

    protected String getGenericName() {
        return ((Class<ET>) ((ParameterizedType) getClass()
        .getGenericSuperclass()).getActualTypeArguments()[0]).getSimpleName();
    }
}