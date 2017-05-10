package com.apim.server.services.admin;

import com.apim.server.dao.DAOAPIImpl;
import com.apim.server.dao.DAOFactory;
import com.apim.server.dao.DAOFactoryImpl;
import com.apim.server.entities.API;
import com.apim.server.entities.EntityFactory;
import com.apim.server.entities.EntityFactoryImpl;
import com.apim.server.services.Service;
import jolie.runtime.FaultException;
import jolie.runtime.JavaService;
import jolie.runtime.Value;

/**
 * Created by alberto on 23/04/17.
 */
public class ServiceEditAPIAdmin extends JavaService implements Service {
    public Boolean editAPIAdmin(Value newAPI) throws FaultException {
        EntityFactory ef = new EntityFactoryImpl();
        DAOFactory df = new DAOFactoryImpl();
        DAOAPIImpl daoapi = df.createDAOAPI();
        String id = newAPI.getFirstChild("id").strValue();
        API api = ef.createAPI(newAPI);
        daoapi.update(api);
        return true; // TODO: return appropriate boolean
    }
}
