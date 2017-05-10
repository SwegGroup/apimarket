package com.apim.server.entities;

import jolie.runtime.Value;

import java.util.Date;

/**
 * Created by alberto on 24/04/17.
 */
public interface EntityFactory {
    //crea uno user senza parametri
    User createUser();

    //crea da Jolie Value
    User createUser(Value v);

    //crea uno user passando i parametri
    User createUser(String user, String password, String nome, String cognome, Date dataNascita, String mail, String numeroCarta, String indirizzo, String telefono, String fotoProfilo, String bio, double saldoCoin, boolean admin);

    User createUser(User user);

    //crea una API senza parametri
    API createAPI();

    //crea da Jolie Value
    API createAPI(Value v);

    //crea una API passando i parametri
    API createAPI(String nome, String linkFile, String linkPDF, int numeroVoti, double ratingMedio, double tempoMedioRisposta, int totaleChiamate, double traffico, double tempoRispostaTotale, String username, int idCategoria);

    //crea una API copiando i parametri della API passata
    API createAPI(API api);

    //crea una key senza parametri
    Key createKey();

    //crea da Jolie Value
    Key createKey(Value v);

    //crea una key passando i parametri
    Key createKey(String id, Date dataScadenza, double maxByte, double tempoUso, String username, String nomeAPI);

    Key createKey(Key key);

    //crea un commento senza parametri
    Comment createComment();

    //crea da Jolie Value
    Comment createComment(Value v);

    //crea un commento passando i parametri
    Comment createComment(String testo, int rate, String username, String nomeApi, int id);

    //crea un commento copiando i parametri del commento passato
    Comment createComment(Comment comment);

    //crea un acquisto senza parametri
    Acquisto createAcquisto();

    //crea da Jolie Value
    Acquisto createAcquisto(Value v);

    //crea un acquisto passando i parametri
    Acquisto createAcquisto(String user, String api, int id);

    //crea un acquisto copiando i parametri dell'acquisto passato
    Acquisto createAcquisto(Acquisto acquisto);

    //crea una categoria senza parametri
    Categoria createCategoria();

    //crea da Jolie Value
    Categoria createCategoria(Value v);

    //crea una categoria passando i parametri
    Categoria createCategoria(String nome, int id);

    //crea una categoria copiando i parametri della categoria passata
    Categoria createCategoria(Categoria categoria);
}
