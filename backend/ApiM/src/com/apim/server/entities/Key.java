package com.apim.server.entities;

import jolie.runtime.Value;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created on 06/04/2017.
 */
@javax.persistence.Entity
@Table(name="Key")
public class Key implements Entity {
    @Id
    @Column(name = "id")
    private String id;
    @Column(name = "dataScadenza")
    private Date dataScadenza;
    @Column(name = "maxByte")
    private double maxByte;
    @Column(name = "tempoUso")
    private double tempoUso;
    @Column(name = "username")
    private String username;
    @Column(name = "nomeAPI")
    private String nomeAPI;

    Key() {
    }

    Key(String id, Date dataScadenza, double maxByte, double tempoUso, String username, String nomeAPI) {
        this.id = id;
        this.dataScadenza = dataScadenza;
        this.maxByte = maxByte;
        this.tempoUso = tempoUso;
        this.username = username;
        this.nomeAPI = nomeAPI;
    }

    Key(Key other) {
        this.id = other.id;
        this.dataScadenza = other.dataScadenza;
        this.maxByte = other.maxByte;
        this.tempoUso = other.tempoUso;
        this.username = other.username;
        this.nomeAPI = other.nomeAPI;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getDataScadenza() {
        return dataScadenza;
    }

    public void setDataScadenza(Date dataScadenza) {
        this.dataScadenza = dataScadenza;
    }

    public double getMaxByte() {
        return maxByte;
    }

    public void setMaxByte(double maxByte) {
        this.maxByte = maxByte;
    }

    public double getTempoUso() {
        return tempoUso;
    }

    public void setTempoUso(double tempoUso) {
        this.tempoUso = tempoUso;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNomeAPI() {
        return nomeAPI;
    }

    public void setNomeAPI(String nomeAPI) {
        this.nomeAPI = nomeAPI;
    }
    
    public Value toJolieValue() {
        
        Value jReq = Value.create();
        
        jReq.getNewChild("id").setValue(id);
        jReq.getNewChild("dataScadenza").setValue(dataScadenza);
        jReq.getNewChild("maxByte").setValue(maxByte);
        jReq.getNewChild("tempoUso").setValue(tempoUso);
        jReq.getNewChild("username").setValue(username);
        jReq.getNewChild("nomeAPI").setValue(nomeAPI);
    
        return jReq;
    }
}
