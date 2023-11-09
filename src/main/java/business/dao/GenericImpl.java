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

import jakarta.persistence.*;
import jakarta.transaction.Transactional;
import jakarta.transaction.UserTransaction;

import javax.naming.InitialContext;
import javax.naming.NamingException;


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
    @PersistenceContext(name = "AcademyRegisterPU")
    protected EntityManager em;

    @PersistenceUnit
    EntityManagerFactory emf;
    private Class < ET > persistentClass;

    @Override
    @Transactional
    public ET add(ET entity) {
        try {
            UserTransaction tx = getUserTransaction();
            tx.begin();
            em.persist(entity);
            tx.commit();
            return entity;
        } catch (Exception ex) {
            UtilLogger.error(getEntityName() + ".add", ex);
            return null;
        }
    }

    private static UserTransaction getUserTransaction() throws NamingException {
        UserTransaction tx = (UserTransaction)new InitialContext().lookup("java:comp/UserTransaction");
        return tx;
    }

    @Override
    @Transactional
    public ET update(ET entity) {
        try {
            UserTransaction tx = getUserTransaction();
            tx.begin();
            em.merge(entity);
            tx.commit();
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
    @Transactional
    public void delete(ET entity) {
        try {
            UserTransaction tx = getUserTransaction();
            tx.begin();
            em.remove(entity);
            tx.commit();
        } catch (Exception e) {
            UtilLogger.error(this.getClass().getName() + ".update", e);
        }
    }

    protected String getEntityName() {
        return this.persistentClass.getSimpleName();
    }


}