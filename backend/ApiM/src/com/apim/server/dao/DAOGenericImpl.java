package com.apim.server.dao;

import javax.persistence.EntityManager;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/**
 * Created by alberto on 21/04/17.
 */
public abstract class DAOGenericImpl<T> implements DAOGeneric<T> {
    EntityManager em;

    private Class<T> type;

    @SuppressWarnings("unchecked")
    DAOGenericImpl() {
        Type t = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) t;
        type = (Class) pt.getActualTypeArguments()[0];
    }

    // Creates new entity t in Database
    @Override
    public T create(final T t) {
        this.em.persist(t);
        return t;
    }

    // Deletes entity from Database, with id primary key
    @Override
    public void delete(final Object id) {
        this.em.remove(this.em.getReference(type, id));
    }

    // Get entity from id
    @Override
    public T find(final Object id) {
        return (T) this.em.find(type, id);
    }

    // Update entity t in database
    @Override
    public T update(final T t) {
        return this.em.merge(t);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<T> findAll() {
        return em.createQuery("Select t from " + type.getSimpleName() + " t").getResultList();
    }
}
