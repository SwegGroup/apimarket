package com.apim.server.services.keymanager;

import com.apim.server.services.Service;
import com.apim.server.utilities.Encrypter;
import jolie.runtime.JavaService;

/**
 * Created by alberto on 04/04/17.
 */
class ServiceCheckKey extends JavaService implements Service {
    Boolean checkKey(String k) {
        String k1 = Encrypter.md5(k);
        String k2 = "Hello"; //get encrypted string from database
        return k1.equals(k2);
    }
}
