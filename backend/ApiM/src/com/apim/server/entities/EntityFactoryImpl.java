package com.apim.server.entities;

import jolie.runtime.Value;

import java.util.Date;

/**
 * Created by Pigiu on 11/04/2017.
 */
public class EntityFactoryImpl implements EntityFactory {

    //crea uno user senza parametri
    @Override
    public User createUser(){
        return new User();
    }

    //crea uno user passando i parametri
    @Override
    public User createUser(String user, String password, String nome, String cognome, Date dataNascita, String mail, String numeroCarta, String indirizzo, String telefono, String fotoProfilo, String bio, double saldoCoin, boolean admin){
        return new User(user, password, nome, cognome, mail, numeroCarta, indirizzo, telefono, fotoProfilo, bio, saldoCoin, admin, dataNascita);
    }

    @Override
    public User createUser(User user) {
        return new User(user);
    }

    //crea una API senza parametri
    @Override
    public API createAPI(){
        return new API();
    }

    //crea una API passando i parametri
    @Override
    public API createAPI(String nome, String linkFile, String linkPDF, int numeroVoti, double ratingMedio, double tempoMedioRisposta, int totaleChiamate, double traffico, double tempoRispostaTotale, String username, int idCategoria){
        return new API(nome, linkFile, linkPDF, numeroVoti, ratingMedio, tempoMedioRisposta,  totaleChiamate, traffico, tempoRispostaTotale, username, idCategoria);
    }

    //crea una API copiando i parametri della API passata
    @Override
    public API createAPI(API api){
        return new API(api);
    }

    //crea una key senza parametri
    @Override
    public Key createKey(){
        return new Key();
    }

    //crea una key passando i parametri
    @Override
    public Key createKey(String id, Date dataScadenza, double maxByte, double tempoUso, String username, String nomeAPI){
        return new Key (id, dataScadenza, maxByte, tempoUso, username, nomeAPI);
    }

    @Override
    public Key createKey(Key key) {
        return new Key(key);
    }

    //crea un commento senza parametri
    @Override
    public Comment createComment(){
        return new Comment();
    }

    //crea un commento passando i parametri
    @Override
    public Comment createComment(String testo, int rate, String username, String nomeApi, int id){
        return new Comment(id, testo, rate, username, nomeApi);
    }

    //crea un commento copiando i parametri del commento passato
    @Override
    public Comment createComment(Comment comment){
        return new Comment(comment);
    }

    //crea un acquisto senza parametri
    @Override
    public Acquisto createAcquisto(){
        return new Acquisto();
    }

    //crea un acquisto passando i parametri
    @Override
    public Acquisto createAcquisto(String user, String api, int id){
        return new Acquisto(id, user, api);
    }

    //crea un acquisto copiando i parametri dell'acquisto passato
    @Override
    public Acquisto createAcquisto(Acquisto acquisto){
        return new Acquisto(acquisto);
    }

    //crea una categoria senza parametri
    @Override
    public Categoria createCategoria(){
        return new Categoria();
    }

    //crea una categoria passando i parametri
    @Override
    public Categoria createCategoria(String nome, int id){
        return new Categoria(id, nome);
    }

    //crea una categoria copiando i parametri della categoria passata
    @Override
    public Categoria createCategoria(Categoria categoria){
        return new Categoria(categoria);
    }

    @Override
    public User createUser(Value v) {
        return new User("bob","bob","bob","bob","bob","5000","bob","bob","bob","bob",50,true,new Date());
    }

    @Override
    public API createAPI(Value v) {
        return null;
    }

    @Override
    public Key createKey(Value v) {
        return null;
    }

    @Override
    public Comment createComment(Value v) {
        return null;
    }

    @Override
    public Acquisto createAcquisto(Value v) {
        return null;
    }

    @Override
    public Categoria createCategoria(Value v) {
        return null;
    }
}