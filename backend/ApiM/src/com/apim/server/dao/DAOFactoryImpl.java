package com.apim.server.dao;

/**
 * Created by alberto on 21/04/17.
 */

// EXAMLE: DAOFactoryImpl.createDAO("User");

public class DAOFactoryImpl implements DAOFactory {

    @Override
    public DAOUserImpl createDAOUser() {
        return new DAOUserImpl();
    }

    @Override
    public DAOAPIImpl createDAOAPI() {
        return new DAOAPIImpl();
    }

    @Override
    public DAOCommentImpl createDAOComment() {
        return new DAOCommentImpl();
    }

    @Override
    public DAOKeyImpl createDAOKey() {
        return new DAOKeyImpl();
    }
}
