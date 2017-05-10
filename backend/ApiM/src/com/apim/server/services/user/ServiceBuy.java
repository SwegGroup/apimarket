package com.apim.server.services.user;

import com.apim.server.entities.API;
import com.apim.server.entities.User;
import com.apim.server.services.Service;
import jolie.runtime.JavaService;

/**
 * Created by Pigiu on 12/04/2017.
 */
public class ServiceBuy extends JavaService implements Service {

    public boolean buyKey(User u, API a){
        //acquistoManager...
        return true;
    }


}


