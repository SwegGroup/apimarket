package com.apim.server.services.gateway;

import com.apim.server.services.Service;
import com.apim.server.utilities.CourierGenerator;
import jolie.runtime.JavaService;
import jolie.runtime.Value;

import java.io.IOException;

/**
 * Created by alberto on 28/04/17.
 */
public class ServiceCourierGenerator extends JavaService implements Service {
    public Boolean generate(Value in) {
        String an = in.getFirstChild("apiName").strValue();
        String aif = in.getFirstChild("apiInterfaceFileName").strValue();
        String ap = in.getFirstChild("apiPortName").strValue();
        String ain = in.getFirstChild("apiInterfaceName").strValue();
        CourierGenerator cg = new CourierGenerator(an, aif, ap, ain);
        try {
            cg.generate();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
