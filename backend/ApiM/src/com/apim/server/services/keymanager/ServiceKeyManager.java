package com.apim.server.services.keymanager;

import com.apim.server.services.Service;
import jolie.runtime.JavaService;

/**
 * Created by alberto on 04/04/17.
 */
public class ServiceKeyManager extends JavaService implements Service {
    private ServiceCheckKey kc;
    private ServiceKeyGen kg;

    public String newKey () {
        return kg.newKey();
    }

    public boolean checkKey (String k) {
        return kc.checkKey(k);
    }
}
