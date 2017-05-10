package com.apim.server.services.user;

import com.apim.server.dao.*;
import com.apim.server.services.Service;
import jolie.runtime.JavaService;

/**
 * Created by Pigiu on 10/04/2017.
 */
class ServiceDeleteUser extends JavaService implements Service {
    boolean deleteUser(String id){
        //il metodo rimuove dal DB l'utente che possiede l'id passato, se non esiste alcun utente con tale id nel DB il metodo ritorna false
        DAOUserImpl dao = new DAOUserImpl();
        dao.delete(id);
        return true;
    }
}
