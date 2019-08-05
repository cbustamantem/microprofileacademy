/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.config;

import java.util.HashSet;
import java.util.Set;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import org.eclipse.microprofile.openapi.annotations.OpenAPIDefinition;
import org.eclipse.microprofile.openapi.annotations.info.Contact;
import org.eclipse.microprofile.openapi.annotations.info.Info;
import org.eclipse.microprofile.openapi.annotations.servers.Server;

/**
 *
 * @author cbustamante
 */
@ApplicationPath("/api")
@OpenAPIDefinition(info = @Info(
            title = "MicroAcademy application", 
            version = "1.0.0", 
            contact = @Contact(
                    name = "Carlos Bustamante", 
                    email = "cbustamante@consultoresinformaticos.com.py",
                    url = "http://www.consultoresinformaticos.com.py")
            ),
            servers = {
                @Server(url = "/",description = "localhost")
            }
    )
public class ApplicationConfig extends Application {

  
}