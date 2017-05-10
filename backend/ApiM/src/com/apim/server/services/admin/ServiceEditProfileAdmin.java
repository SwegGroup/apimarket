package com.apim.server.services.admin;

import com.apim.server.dao.DAOUserImpl;
import com.apim.server.entities.EntityFactory;
import com.apim.server.entities.EntityFactoryImpl;
import com.apim.server.entities.User;
import com.apim.server.services.Service;
import jolie.runtime.FaultException;
import jolie.runtime.JavaService;
import jolie.runtime.Value;

/**
 * Created by alberto on 23/04/17.
 */
public class ServiceEditProfileAdmin extends JavaService implements Service {
    public Boolean editProfileAdmin (Value newProfile) throws FaultException {
        EntityFactory ef = new EntityFactoryImpl();
        DAOUserImpl daoUser = new DAOUserImpl();
        User user = ef.createUser(newProfile);
        daoUser.update(user);
        return true; // TODO: return appropriate boolean
    }
}
