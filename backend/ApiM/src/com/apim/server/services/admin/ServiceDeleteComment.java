package com.apim.server.services.admin;

import com.apim.server.dao.DAOCommentImpl;
import com.apim.server.services.Service;
import jolie.runtime.FaultException;
import jolie.runtime.JavaService;

/**
 * Created by alberto on 23/04/17.
 */
public class ServiceDeleteComment extends JavaService implements Service {
    public Boolean deleteComment(Integer id) throws FaultException {
        DAOCommentImpl daoComment = new DAOCommentImpl();
        daoComment.delete(id);
        return true;
    }
}
