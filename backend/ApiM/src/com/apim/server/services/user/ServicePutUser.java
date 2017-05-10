package com.apim.server.services.user;

import com.apim.server.dao.DAOUserImpl;
import com.apim.server.entities.User;
import com.apim.server.services.Service;
import jolie.runtime.JavaService;

/**
 * Created by Pigiu on 10/04/2017.
 */
public class ServicePutUser extends JavaService implements Service {
    public boolean putUser(User u){
        //il metodo inserisce un nuovo user nel DB, se l'operazione va a buon fine viene ritornato un valore true, altrimenti fals
        DAOUserImpl dao = new DAOUserImpl();
        // creating new user in database
        dao.create(u);
        return true;
    }
}
