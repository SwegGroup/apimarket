package com.apim.server.dao;

import java.util.List;

/**
 * Created by alberto on 21/04/17.
 */
public interface DAOGeneric<T> {
    T create(T t);

    void delete(Object id);

    T find(Object id);

    T update(T t);

    List<T> findAll();
}
