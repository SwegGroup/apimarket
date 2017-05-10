package com.apim.server.services.admin;

import com.apim.server.dao.DAOUserImpl;
import com.apim.server.entities.User;
import com.apim.server.services.Service;
import jolie.runtime.FaultException;
import jolie.runtime.JavaService;
import jolie.runtime.Value;

/**
 * Created by alberto on 23/04/17.
 */
public class ServiceSearchUser extends JavaService implements Service {
    public Value searchUser(String id) throws FaultException {
        DAOUserImpl dao = new DAOUserImpl();
        User user = dao.find(id);
        return user.toJolieValue();
    }
}
