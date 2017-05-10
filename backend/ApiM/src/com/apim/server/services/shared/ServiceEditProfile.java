package com.apim.server.services.shared;

import com.apim.server.dao.DAOFactory;
import com.apim.server.dao.DAOFactoryImpl;
import com.apim.server.dao.DAOUser;
import com.apim.server.dao.DAOUserImpl;
import com.apim.server.entities.EntityFactory;
import com.apim.server.entities.EntityFactoryImpl;
import com.apim.server.entities.User;
import com.apim.server.services.Service;
import jolie.runtime.JavaService;
import jolie.runtime.Value;

/**
 * Created by Pigiu on 10/04/2017.
 */
public class ServiceEditProfile extends JavaService implements Service {
    public boolean updateUser(User user){
        //il metodo aggiorna le informazioni riguardanti un utente
        DAOFactoryImpl factory = new DAOFactoryImpl();
        DAOUserImpl dao = new DAOUserImpl();
        EntityFactory ef = new EntityFactoryImpl();
        User u = ef.createUser(user);
        dao.update(u);
        return false;
    }
}
