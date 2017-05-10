package com.apim.server.entities;

import jolie.runtime.Value;

/**
 * Created by alberto on 22/04/17.
 */
public interface Entity {
    Value toJolieValue();
    /*
            EXAMPLE
            toJolieValue(){
                Value v = Value.create()
                   v.getNewChild("username").setValue(this.username);
		            v.getNewChild("password").setValue(this.password);
		            ...
            }

     */
}
