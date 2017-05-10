package com.apim.server.dao;

/**
 * Created by alberto on 22/04/17.
 */
public interface DAOFactory {
    DAOUser createDAOUser();

    DAOAPIImpl createDAOAPI();

    DAOCommentImpl createDAOComment();

    DAOKeyImpl createDAOKey();
}
