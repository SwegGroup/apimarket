package com.apim.server.dao; /**
 * Created by Utente on 12/04/2017.
 */
import com.apim.server.entities.User;

import javax.persistence.Query;
import java.util.List;

public class DAOUserImpl extends DAOGenericImpl<User> implements DAOUser {

    /* Questa classe espone i metodi:
        loadUserByUsername, definito in DAOUser e implementato qui
        find, create, update, delete, definiti in DAOGeneric e implementati in DAOGenericImpl
     */

    @Override
    public User loadUserByUsername(String username) {
        Query query = this.em
                .createQuery("select u FROM User u where u.username= :username");
        query.setParameter("username", username);
        List<User> users = query.getResultList();
        if (users != null && users.size() == 1) {
            return users.get(0);
        }
        return null;
    }
}
