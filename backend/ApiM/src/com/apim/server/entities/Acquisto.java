package com.apim.server.entities;


import jolie.runtime.Value;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created on 06/04/2017.
 */
@javax.persistence.Entity
@Table(name = "Acquisto")
public class Acquisto implements Entity {
    @Id
    @Column(name = "idAcquisto")
    private int idAcquisto;
    @Column(name = "username")
    private String username;
    @Column(name = "key")
    private String key;

    Acquisto(){}

    Acquisto(int idAcquisto, String username, String key) {
        this.idAcquisto = idAcquisto;
        this.username = username;
        this.key = key;
    }

    Acquisto(Acquisto other) {
        this.idAcquisto = other.idAcquisto;
        this.username = other.username;
        this.key = other.key;
    }

    public int getIdAcquisto() {
        return idAcquisto;
    }

    public void setIdAcquisto(int idAcquisto) {
        this.idAcquisto = idAcquisto;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
    
    public Value toJolieValue() {
        Value jReq = Value.create();
        
       jReq.getNewChild("idAcquisto").setValue(this.idAcquisto);
       jReq.getNewChild("username").setValue(this.username);
       jReq.getNewChild("key").setValue(this.key);
       
       return jReq;
    }
}
