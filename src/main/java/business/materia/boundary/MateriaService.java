/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.materia.boundary;

import business.materia.entities.Materia;
import business.utils.UtilLogger;
import java.util.List;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.json.Json;
import jakarta.json.JsonObject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponses;
import org.eclipse.microprofile.openapi.annotations.tags.Tag;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;

/**
 *
 * @author cbustamante
 */
@RequestScoped
@Path("/materias")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Tag(name = "MateriaService", description = "Gestion de Materias")
public class MateriaService{
    
    
    @Inject
    MateriaManager materiaMgr;
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(description = "Cliente por Vendedor")
    @APIResponses(value = {
        @APIResponse(responseCode = "200", description = "Ok"),
        @APIResponse(responseCode = "404", description = "Error materia no encontrado"),
        @APIResponse(responseCode = "500", description = "Error interno")})
    public Response getAll() {
        try {
            UtilLogger.info("MateriaService - getAll");
            List<Materia> listaMaterias = materiaMgr.getAll();
            UtilLogger.info("MateriaService - listaMaterias size :" + listaMaterias.size());
            if (!listaMaterias.isEmpty()) {                
                Jsonb jsonb = JsonbBuilder.create();
                UtilLogger.info("MateriaService - listaMaterias json :" +jsonb.toJson(listaMaterias));
                return Response.status(200).entity(jsonb.toJson(listaMaterias)).build();
            } else {
                JsonObject value = Json.createObjectBuilder()
                        .add("response", "404")
                        .add("message", "No se encuentran registrados materias")
                        .build();
                return Response.status(404).entity(value).build();
            }
        } catch (Exception e) {
            JsonObject value = Json.createObjectBuilder()
                    .add("response", "500")
                    .add("message", e.getMessage())
                    .build();
            
            UtilLogger.error("MateriasService - getAll ",e);
            e.printStackTrace();
            return Response.status(500).entity(value).build();
            
        }

    }
    
}
