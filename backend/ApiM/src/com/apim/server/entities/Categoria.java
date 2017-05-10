package com.apim.server.entities;


import jolie.runtime.Value;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created on 06/04/2017.
 */
@javax.persistence.Entity
@Table(name = "Categoria")
public class Categoria implements Entity {
    @Id
    @Column(name = "idCategoria")
    private int idCategoria;
    @Column(name = "categoria")
    private String categoria;

    Categoria() {
    }

    Categoria(int idCategoria, String categoria) {
        this.idCategoria = idCategoria;
        this.categoria = categoria;
    }

    Categoria(Categoria other) {
        this.idCategoria = other.idCategoria;
        this.categoria = other.categoria;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    public Value toJolieValue(){
        
        Value jReq = Value.create();
        
        jReq.getNewChild("idCategoria").setValue(idCategoria);
        jReq.getNewChild("categoria").setValue(categoria);
        
        return jReq;
    }
}
