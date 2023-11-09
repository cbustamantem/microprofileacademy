/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.alumnos.boundary;

import business.alumnos.entities.Alumno;
import business.alumnos.entities.vo.Alumnos;
import business.utils.UtilLogger;
import java.text.SimpleDateFormat;
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
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.QueryParam;
import org.eclipse.microprofile.metrics.MetricUnits;
import org.eclipse.microprofile.metrics.annotation.Counted;
import org.eclipse.microprofile.metrics.annotation.Metered;
import org.eclipse.microprofile.metrics.annotation.Timed;

/**
 *
 * @author cbustamante
 */
@RequestScoped
@Path("/alumnos")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Tag(name = "AlumnoService", description = "Gestion de Alumnos")
public class AlumnoService{
    
    
    @Inject
    AlumnoManager alumnoMgr;
    
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(description = "Cliente por Vendedor")
    @APIResponses(value = {
    @APIResponse(responseCode = "200", description = "Ok"),
    @APIResponse(responseCode = "404", description = "Error alumno no encontrado"),
    @APIResponse(responseCode = "500", description = "Error interno")})
    @Timed(name = "getAllStudents",
    description = "Monitor the time getAll Method takes",
    unit = MetricUnits.MILLISECONDS, absolute = true)
    @Metered(name = "avgAllStudens")   
    public Response getAll() {
        try {
            UtilLogger.info("AlumnoService - getAll");
            List<Alumno> listaAlumnos = alumnoMgr.getAll();            
            if (!listaAlumnos.isEmpty()) {                
                Alumnos alumnos = new Alumnos(listaAlumnos);                
                UtilLogger.info("AlumnoService - listaAlumnos json :" +alumnos.toJson());
                return Response.status(200).entity(alumnos.toJson()).build();
            } else {
                JsonObject value = Json.createObjectBuilder()
                        .add("response", "404")
                        .add("message", "No se encuentran registrados alumnos")
                        .build();
                return Response.status(404).entity(value).build();
            }
        } catch (Exception e) {
            JsonObject value = Json.createObjectBuilder()
                    .add("response", "500")
                    .add("message", e.getMessage())
                    .build();            
            UtilLogger.error("AlumnosService - getAll ",e);
            return Response.status(500).entity(value).build();            
        }

    }
    
    @PUT()
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(description = "Agregar Alumno")
    @APIResponses(value = {
    @APIResponse(responseCode = "201", description = "Ok creado"),    
    @APIResponse(responseCode = "500", description = "Error interno")})
    @Metered(name = "addAlumno",
    unit = MetricUnits.MILLISECONDS,
    description = "Monitor the rate events occured",
    absolute = true)
    @Counted
    public Response addAlumno(            
        @QueryParam(value = "nombre") String nombre,    
        @QueryParam(value = "apellido") String apellido,    
        @QueryParam(value = "email") String email,    
        @QueryParam(value = "documento") String documento,
        @QueryParam(value = "sexo") String sexo,
        @QueryParam(value = "fechaNac") String fechaNac,    
        @QueryParam(value = "telefono") String telefono,    
        @QueryParam(value = "direccion") String direccion) {
        try {
            UtilLogger.info("AlumnoService - agregar Alumno");
            SimpleDateFormat sf = new SimpleDateFormat("dd/mm/yyyyy");
            Alumno add = alumnoMgr.addAlumnoFromService(nombre,apellido,email,documento,sexo.charAt(0),sf.parse(fechaNac),telefono,direccion);
            if (add !=null) {
                
                UtilLogger.info("AlumnoService - listaAlumnos json :");
                return Response.status(201).entity(true).build();
            } else {
                JsonObject value = Json.createObjectBuilder()
                        .add("response", "404")
                        .add("message", "No se encuentran registrados alumnos")
                        .build();
                return Response.status(404).entity(value).build();
            }
        } catch (Exception e) {
            JsonObject value = Json.createObjectBuilder()
                    .add("response", "500")
                    .add("message", e.getMessage())
                    .build();
            UtilLogger.error("AlumnosService - getAll ",e);
            return Response.status(500).entity(value).build();            
        }

    }
    
    
}
