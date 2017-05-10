package com.apim.server.services.shared;

import com.apim.server.dao.DAOUserImpl;
import com.apim.server.entities.User;
import com.apim.server.services.Service;
import jolie.runtime.JavaService;
import jolie.runtime.Value;

/**
 * Created by Pigiu on 10/04/2017.
 */
public class ServiceViewUser extends JavaService implements Service {
    public Value getUser(String id){
        //il metodo ritorna tutte le informazioni riguardanti l'utente con l'id che corrisponde alla stringa passata
        //se non esiste alcun utente con tale id, viene ritornato un puntatore null

        //attraverso la classe dao effetuo una chiamata al database, dando in input l'id dell'utente ricevo tutte le
        // informazioni a lui riguardanti

        DAOUserImpl dao = new DAOUserImpl();
        User u = dao.find(id);
        return u.toJolieValue();
    }
}
