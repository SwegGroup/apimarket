package com.apim.server.services.user;

import com.apim.server.services.Service;
import jolie.runtime.JavaService;
import com.apim.server.entities.User;
import com.apim.server.services.shared.*;
import jolie.runtime.Value;

/**
 * Created by Pigiu on 04/04/2017.
 */

public class ServiceUserManager extends JavaService implements Service {
    private ServiceViewUser gU;
    private ServiceSignIn pU;
    private ServiceEditProfile uU;
    private ServiceDeleteUser dU;

    public Value getUser(String id){
        return gU.getUser(id);
    }

    public boolean putUser(Value u){ return pU.signIn(u); }

    public boolean updateUser(User u){
        return uU.updateUser(u);
    }

    public boolean deleteUser(String id){
        return dU.deleteUser(id);
    }
}
