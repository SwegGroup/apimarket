package com.apim.server.entities;

import jolie.runtime.Value;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created on 06/04/2017.
 */



@javax.persistence.Entity
@Table(name="Users")
public class Comment implements Entity {
    @Id
    @Column(name = "idCommento")
    private int idCommento;
    @Column(name = "testo")
    private String testo;
    @Column(name = "rating")
    private int rating;
    @Column(name = "username")
    private String username;
    @Column(name = "nomeAPI")
    private String nomeAPI;

    Comment() {
    }

    Comment(int idCommento, String testo, int rating, String username, String nomeAPI) {
        this.idCommento = idCommento;
        this.testo = testo;
        this.rating = rating;
        this.username = username;
        this.nomeAPI = nomeAPI;
    }

    Comment(Comment other) {
        this.idCommento = other.idCommento;
        this.testo = other.testo;
        this.rating = other.rating;
        this.username = other.username;
        this.nomeAPI = other.nomeAPI;
    }

    public int getIdCommento() {
        return idCommento;
    }

    public void setIdCommento(int idCommento) {
        this.idCommento = idCommento;
    }

    public String getTesto() {
        return testo;
    }

    public void setTesto(String testo) {
        this.testo = testo;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
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
        
        jReq.getNewChild("idCommento").setValue(idCommento);
        jReq.getNewChild("testo").setValue(testo);
        jReq.getNewChild("rating").setValue(rating);
        jReq.getNewChild("username").setValue(username);
        jReq.getNewChild("nomeAPI").setValue(nomeAPI);
    
        return jReq;
    }
}
