package com.apim.server.services.shared;

import com.apim.server.dao.DAOAPI;
import com.apim.server.dao.DAOAPIImpl;
import com.apim.server.dao.DAOFactory;
import com.apim.server.dao.DAOFactoryImpl;
import com.apim.server.entities.API;
import com.apim.server.entities.EntityFactory;
import com.apim.server.services.Service;
import jolie.runtime.JavaService;
import jolie.runtime.Value;

/**
 * Created by Pigiu on 13/04/2017.
 */
public class ServiceSearch extends JavaService implements Service {

    public Value Search(String nome){
        //il metodo ritorna un oggetto API con il nome uguale alla stringa passata per riferimento
        DAOAPIImpl dao = new DAOAPIImpl();
        return dao.find(nome).toJolieValue();
    }

}
