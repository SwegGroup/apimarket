package com.apim.server.services.user;

import com.apim.server.dao.DAOUserImpl;
import com.apim.server.entities.EntityFactory;
import com.apim.server.entities.EntityFactoryImpl;
import com.apim.server.entities.User;
import com.apim.server.services.Service;
import jolie.runtime.JavaService;
import jolie.runtime.Value;

/**
 * Created by Pigiu on 12/04/2017.
 */
public class ServiceSignIn extends JavaService implements Service {

    public boolean signIn(Value u){
        //Il metodo crea un nuovo record all'interno del DB nella tabella User con le indicazioni passate per riferimento
        //se l'operazione va a buon fine ritorna true, altrimenti false
        //return DAOUser.checkSignIn(u);
        EntityFactory ef = new EntityFactoryImpl();
        User user = ef.createUser(u);
        System.out.printf(user.getNome()+" "+user.getCognome());
        DAOUserImpl dao = new DAOUserImpl();
        dao.create(user);
        return true;
    }
}

//esempio di inserimento dati in tabella

/*int valore = 25; //valore di esempio
int esito; //esito aggiornamento
Connection conn = null;

//carica il file di classe del driver per il ponte Odbc
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

//crea la connessione con l'origine dati
conn = DriverManager.getConnection("jdbc:odbc:miodb","","");

//crea lo statement
Statement st = conn.createStatement();

//esegue l'aggiornameto o l'inserimento
esito = st.executeUpdate("INSERT INTO tab1 (dati) values ("+valore+")"))
//se esito � uguale a 1 tutto � andato bene
if (esito == 1)
out.println("inserimento eseguito correttamente");
else
out.println("inserimento non eseguito");


rs.close();
conn.close();
*/