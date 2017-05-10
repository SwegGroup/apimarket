package com.apim.server.services.keymanager;

import com.apim.server.services.Service;
import com.apim.server.utilities.Encrypter;
import jolie.runtime.JavaService;

/**
 * Created by alberto on 04/04/17.
 */
class ServiceKeyGen extends JavaService implements Service {
    String newKey() {
        //String s = getUserString + getApiString
        String s = "Hello";
        s = Encrypter.md5(s);
        return s;
    }
}
