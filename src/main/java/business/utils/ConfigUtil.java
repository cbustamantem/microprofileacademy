/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.utils;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

/**
 *
 * @author cbustamante
 */
public class ConfigUtil {
    private static Properties properties;
    private static boolean config;
    public  static  String database;
    public static  String schema;
    
    private static void init ()    
   
    {
        try
        {
            FileInputStream fileInput = new FileInputStream(new File("/resources/config.properties"));
            properties = new Properties();
            properties.load(fileInput);
        }
        catch(Exception ex)
        {
            System.out.println("No se encuentra el archivo de configuracion");
        }
                
        
        config = true;
    }
    public static String getConfig (String conf)
    {
        if (!config)
        {
            init ();
        }
        try
        {
            return properties.get(conf).toString().trim();
        }
        catch(Exception ex)
        {
            System.out.println("Error al retornar la propiedad:" + conf);
        }
        return "";
    }
    
}
