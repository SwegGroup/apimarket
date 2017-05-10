package com.apim.server.services.shared;

import com.apim.server.dao.DAOFactory;
import com.apim.server.dao.DAOFactoryImpl;
import com.apim.server.dao.DAOUser;
import com.apim.server.dao.DAOUserImpl;
import com.apim.server.entities.User;
import com.apim.server.services.Service;
import jolie.runtime.JavaService;

/**
 * Created by Pigiu on 13/04/2017.
 */
public class ServiceLogIn extends JavaService implements Service {

    public Boolean logIn(String id, String pass){
        DAOUserImpl dao = new DAOUserImpl();
        User usr = dao.find(id);
        // SessionManager.start();
        return usr!=null;
    }
}
