package com.apim.server.services.shared;

import com.apim.server.dao.DAOAPIImpl;
import com.apim.server.entities.API;
import com.apim.server.services.Service;
import jolie.runtime.JavaService;

/**
 * Created by Pigiu on 13/04/2017.
 */
public class ServiceViewStat extends JavaService implements Service {
    public String viewStat(String id){
        DAOAPIImpl dao = new DAOAPIImpl();
        API a = dao.find(id);
        return "L'API "+a.getNomeAPI()+" ha le seguenti statistiche:\n -Tempo medio di risposta: "+a.getTempoMedioRisposta()+"\n -Totale chiamate: "+a.getTotaleChiamate()+"\n -Traffico: "+a.getTraffico()+"\n -Tempo di risposta totale: "+a.getTempoRispostaTotale();
    }
}
