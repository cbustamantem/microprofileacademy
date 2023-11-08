/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.alumnos.entities.vo;

import business.alumnos.entities.Alumno;
import com.google.gson.Gson;
import java.util.List;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;

/**
 *
 * @author cbustamante
 */
public class Alumnos {
    
    List<Alumno> listaAlumnos;

    public Alumnos(List<Alumno> lista) {
        this.listaAlumnos= lista;
    }

    public List<Alumno> getListaAlumnos() {
        return listaAlumnos;
    }

    public void setListaAlumnos(List<Alumno> listaAlumnos) {
        this.listaAlumnos = listaAlumnos;
    }
    
  
     public String toJson() {
         Jsonb jsonb = JsonbBuilder.create();
         return jsonb.toJson(this);
        //Gson gson = new Gson();
        //return  gson.toJson(this, Alumnos.class);
    }
    
}
