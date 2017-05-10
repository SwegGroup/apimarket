package com.apim.server.services.user;

import com.apim.server.dao.DAOUserImpl;
import com.apim.server.entities.User;
import com.apim.server.services.Service;
import jolie.runtime.JavaService;

/**
 * Created by Pigiu on 10/04/2017.
 */
public class ServiceUpdateUser extends JavaService implements Service {
    public User updateUser(User u){
        //il metodo aggiorna le informazioni riguardanti un utente
        DAOUserImpl dao = new DAOUserImpl();
        return dao.update(u);
    }
}
