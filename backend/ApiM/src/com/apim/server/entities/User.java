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
@Table(name="Users")
public class User implements Entity {
    @Id
    @Column(name = "username")
    private String username;
    @Column(name = "password")
    private String password;
    @Column(name = "nome")
    private String nome;
    @Column(name = "cognome")
    private String cognome;
    @Column(name = "mail")
    private String mail;
    @Column(name = "numeroCarta")
    private String numeroCarta;
    @Column(name = "indirizzo")
    private String indirizzo;
    @Column(name = "telefono")
    private String telefono;
    @Column(name = "fotoProfilo")
    private String fotoProfilo;
    @Column(name = "bio")
    private String bio;
    @Column(name = "saldoCoin")
    private double saldoCoin;
    @Column(name = "admin")
    private boolean admin;
    @Column(name = "dataNascita")
    private Date dataNascita;

    User() {
    }

    User(String username, String password, String nome, String cognome, String mail, String numeroCarta, String indirizzo, String telefono, String fotoProfilo, String bio, double saldoCoin, boolean admin, Date dataNascita) {
        this.username = username;
        this.password = password;
        this.nome = nome;
        this.cognome = cognome;
        this.mail = mail;
        this.numeroCarta = numeroCarta;
        this.indirizzo = indirizzo;
        this.telefono = telefono;
        this.fotoProfilo = fotoProfilo;
        this.bio = bio;
        this.saldoCoin = saldoCoin;
        this.admin = admin;
        this.dataNascita = dataNascita;
    }

    User(User other) {
        this.username = other.username;
        this.password = other.password;
        this.nome = other.nome;
        this.cognome = other.cognome;
        this.mail = other.mail;
        this.numeroCarta = other.numeroCarta;
        this.indirizzo = other.indirizzo;
        this.telefono = other.telefono;
        this.fotoProfilo = other.fotoProfilo;
        this.bio = other.bio;
        this.saldoCoin = other.saldoCoin;
        this.admin = other.admin;
        this.dataNascita = other.dataNascita;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getNumeroCarta() {
        return numeroCarta;
    }

    public void setNumeroCarta(String numeroCarta) {
        this.numeroCarta = numeroCarta;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFotoProfilo() {
        return fotoProfilo;
    }

    public void setFotoProfilo(String fotoProfilo) {
        this.fotoProfilo = fotoProfilo;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public double getSaldoCoin() {
        return saldoCoin;
    }

    public void setSaldoCoin(double saldoCoin) {
        this.saldoCoin = saldoCoin;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public Date getDataNascita() {
        return dataNascita;
    }

    public void setDataNascita(Date dataNascita) {
        this.dataNascita = dataNascita;
    }
    
    public Value toJolieValue() {
        
        Value jReq = Value.create();
        
        jReq.getNewChild("username").setValue(username);
        jReq.getNewChild("password").setValue(password);
        jReq.getNewChild("nome").setValue(nome);
        jReq.getNewChild("cognome").setValue(cognome);
        jReq.getNewChild("mail").setValue(mail);
        jReq.getNewChild("numeroCarta").setValue(numeroCarta);
        jReq.getNewChild("indirizzo").setValue(indirizzo);
        jReq.getNewChild("telefono").setValue(telefono);
        jReq.getNewChild("fotoProfio").setValue(fotoProfilo);
        jReq.getNewChild("bio").setValue(bio);
        jReq.getNewChild("saldoCoin").setValue(saldoCoin);
        jReq.getNewChild("admin").setValue(admin);
        jReq.getNewChild("dataNascita").setValue(dataNascita);
        
        return jReq;
    }
}
