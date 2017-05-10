package com.apim.server.services.dataanalysis;

import jolie.runtime.JavaService;
import jolie.runtime.Value;
import jolie.runtime.ValueVector;

import java.util.Map;

/**
 * Created by alberto on 12/04/17.
 */

public class ServiceAnalyzer extends JavaService {
    public Long getTime() {
        return System.nanoTime();
    }

    public Double timeDiff(Value params) {
        long end = params.getFirstChild("end").longValue();
        long start = params.getFirstChild("start").longValue();
        return (end-start)/1e6;
    }

    /*public Integer getValueSize(ValueVector vector) {
        int size = 0;
        for (Value value :vector) {
            size += value.byteArrayValue().size();
            Map<String, ValueVector> children = value.children();
            for (Map.Entry<String, ValueVector> child : children.entrySet()) {
                System.out.println("Nuovo sottoalbero");
                size += getValueSize(child.getValue());
            }
        }
        return size;
    }*/

    public Integer getValueSize(Value value) {
        int size = value.byteArrayValue().size();
        if (value.hasChildren()) {
            Map<String, ValueVector> children = value.children();
            for (Map.Entry<String, ValueVector> child : children.entrySet()) { // for every child array
                ValueVector vector = child.getValue();
                for (Value v:vector) { // for every child
                    size += getValueSize(v); // recursively calculate size and add
                }
            }
        }
        return size;
    }
}
