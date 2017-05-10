/**
 * Created by Utente on 12/04/2017.
 */
package com.apim.server.dao;

import com.apim.server.entities.User;

public interface DAOUser {
    public User loadUserByUsername(String username);
}
