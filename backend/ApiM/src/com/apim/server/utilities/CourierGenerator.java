package com.apim.server.utilities;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * Created by alberto on 12/04/17.
 */
public class CourierGenerator {
    private static final String PATH = "./my/path";
            // TODO Load info from DB, remove placeholders
    private String apiName;
    private String apiInterfaceFileName;
    private String apiPortName;
    private String apiInterfaceName;

    public CourierGenerator(String apiName, String apiInterfaceFileName, String apiPortName, String apiInterfaceName) {
        this.apiName = apiName;
        this.apiInterfaceFileName = apiInterfaceFileName;
        this.apiPortName = apiPortName;
        this.apiInterfaceName = apiInterfaceName;
    }

    private String readFile(String path, Charset encoding) throws IOException {
        byte[] encoded = Files.readAllBytes(Paths.get(path));
        return new String(encoded, encoding);
    }

    private void writeCourierFile(String apiName, String newText) throws FileNotFoundException {
        try(  PrintWriter out = new PrintWriter( apiInterfaceFileName )  ){
            out.println( newText );
        }
    }

    private String replaceInCourierTemplate(String apiName, String template) throws IOException {
        String res = template.replace("apiName", apiName);
        res = res.replace("{{APIINTERFACEFILENAME}}",apiInterfaceFileName);
        res = res.replace("{{APIPORTNAME}}", apiPortName);
        res = res.replace("{{APIINTERFACENAME}}", apiInterfaceName);
        return res;
    }

    public void generate() throws IOException {
        // read template file
        String template = readFile(PATH, StandardCharsets.UTF_8);
        // replace placeholders with appropriate info
        String res = replaceInCourierTemplate(apiName, template);
        // write courier string to file
        writeCourierFile(apiName, res);
    }
}
