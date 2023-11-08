/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.config;

import java.util.HashSet;
import java.util.Set;
import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;
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
            title = "MicroProfileAcademy application",
            version = "1.0.0", 
            contact = @Contact(
                    name = "Carlos Bustamante", 
                    email = "cbustamantem@gmail.com",
                    url = "http://bustatech.net")
            ),
            servers = {
                @Server(url = "/",description = "localhost")
            }
    )
public class ApplicationConfig extends Application {

  
}