package com.apim.server.entities;


import jolie.runtime.Value;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created on 06/04/2017.
 */
@javax.persistence.Entity
@Table(name = "API")
public class API implements Entity {
    @Id
    @Column(name = "nomeAPI")
    private String nomeAPI;
    @Column(name = "linkFile")
    private String linkFile;
    @Column(name = "linkPdf")
    private String linkPDF;
    @Column(name = "numeroVoti")
    private int numeroVoti;
    @Column(name = "ratingMedio")
    private double ratingMedio;
    @Column(name = "tempoMedioRisposta")
    private double tempoMedioRisposta;
    @Column(name = "totaleChiamate")
    private int totaleChiamate;
    @Column(name = "traffico")
    private double traffico;
    @Column(name = "tempoRispostaTotale")
    private double tempoRispostaTotale;
    @Column(name = "username")
    private String username;
    @Column(name = "idCategoria")
    private int idCategoria;

    API() {
    }

    API(String nomeAPI, String linkFile, String linkPdf, int numeroVoti, double ratingMedio, double tempoMedioRisposta, int totaleChiamate, double traffico, double tempoRispostaTotale, String username, int idCategoria) {
        this.nomeAPI = nomeAPI;
        this.linkFile = linkFile;
        this.linkPDF = linkPdf;
        this.numeroVoti = numeroVoti;
        this.ratingMedio = ratingMedio;
        this.tempoMedioRisposta = tempoMedioRisposta;
        this.totaleChiamate = totaleChiamate;
        this.traffico = traffico;
        this.tempoRispostaTotale = tempoRispostaTotale;
        this.username = username;
        this.idCategoria = idCategoria;
    }

    API(API other) {
        this.nomeAPI = other.nomeAPI;
        this.linkFile = other.linkFile;
        this.linkPDF = other.linkPDF;
        this.numeroVoti = other.numeroVoti;
        this.ratingMedio = other.ratingMedio;
        this.tempoMedioRisposta = other.tempoMedioRisposta;
        this.totaleChiamate = other.totaleChiamate;
        this.traffico = other.traffico;
        this.tempoRispostaTotale = other.tempoRispostaTotale;
        this.username = other.username;
        this.idCategoria = other.idCategoria;
    }

    public String getNomeAPI() {
        return nomeAPI;
    }

    public void setNomeAPI(String nomeAPI) {
        this.nomeAPI = nomeAPI;
    }

    public String getLinkFile() {
        return linkFile;
    }

    public void setLinkFile(String linkFile) {
        this.linkFile = linkFile;
    }

    public String getLinkPDF() {
        return linkPDF;
    }

    public void setLinkPDF(String linkPdf) {
        this.linkPDF = linkPdf;
    }

    public int getNumeroVoti() {
        return numeroVoti;
    }

    public void setNumeroVoti(int numeroVoti) {
        this.numeroVoti = numeroVoti;
    }

    public double getRatingMedio() {
        return ratingMedio;
    }

    public void setRatingMedio(double ratingMedio) {
        this.ratingMedio = ratingMedio;
    }

    public double getTempoMedioRisposta() {
        return tempoMedioRisposta;
    }

    public void setTempoMedioRisposta(double tempoMedioRisposta) {
        this.tempoMedioRisposta = tempoMedioRisposta;
    }

    public int getTotaleChiamate() {
        return totaleChiamate;
    }

    public void setTotaleChiamate(int totaleChiamate) {
        this.totaleChiamate = totaleChiamate;
    }

    public double getTraffico() {
        return traffico;
    }

    public void setTraffico(double traffico) {
        this.traffico = traffico;
    }

    public double getTempoRispostaTotale() {
        return tempoRispostaTotale;
    }

    public void setTempoRispostaTotale(double tempoRispostaTotale) {
        this.tempoRispostaTotale = tempoRispostaTotale;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
    
    public Value toJolieValue() {
        Value jReq = Value.create();
        jReq.getNewChild("nomeAPI").setValue(this.nomeAPI);
        jReq.getNewChild("linkFile").setValue(this.linkFile);
        jReq.getNewChild("linkPDF").setValue(this.linkPDF);
        jReq.getNewChild("numeroVoti").setValue(this.numeroVoti);
        jReq.getNewChild("ratingMedio").setValue(this.ratingMedio);
        jReq.getNewChild("tempoMedioRisposta").setValue(this.tempoMedioRisposta);
        jReq.getNewChild("totaleChiamate").setValue(this.totaleChiamate);
        jReq.getNewChild("traffico").setValue(this.traffico);
        jReq.getNewChild("tempoRispostaTotale").setValue(this.tempoRispostaTotale);
        jReq.getNewChild("username").setValue(this.username);
        jReq.getNewChild("idCategoria").setValue(this.idCategoria);
        
        return jReq;
    }
}
