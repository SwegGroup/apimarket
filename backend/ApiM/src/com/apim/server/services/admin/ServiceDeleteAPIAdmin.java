package com.apim.server.services.admin;

import com.apim.server.dao.DAOAPIImpl;
import com.apim.server.services.Service;
import jolie.runtime.FaultException;
import jolie.runtime.JavaService;

/**
 * Created by alberto on 23/04/17.
 */
public class ServiceDeleteAPIAdmin extends JavaService implements Service {
    public Boolean deleteAPIAdmin(String id) throws FaultException{
        DAOAPIImpl dao = new DAOAPIImpl();
        dao.delete(id);
        return true;
    }
}
