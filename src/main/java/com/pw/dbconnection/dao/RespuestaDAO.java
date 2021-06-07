/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.PreguntaModel;
import com.pw.dbconnection.models.RespuestaModel;
import com.pw.dbconnection.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author molec
 */
public class RespuestaDAO {
    public static List<RespuestaModel> getRespuestas(int idPregunta){
         List<RespuestaModel> respuestas = new ArrayList<>();
         Connection con = null;
         
        try 
        {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("select * from Respuesta where pregunta = ?");
            statement.setInt(1, idPregunta);
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos

            
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
                
                String contenido = resultSet.getString("contenido");
                System.out.println(contenido);
                int id = resultSet.getInt("id");
                String imagenRes = resultSet.getString("imagen");
                String usuarioRes = resultSet.getString("usuario");
                Boolean mejor = resultSet.getBoolean("mejor");
                Date fecha_Res = resultSet.getDate("fecha");             
            
                int util=0;
                /*
                CallableStatement statementUtils = con.prepareCall("SELECT COUNT(*) AS UtilRowCount FROM util_respuesta WHERE respuesta = ?");
                statementUtils.setInt(1, id);
                ResultSet resultSetUtils = statementUtils.executeQuery();
                if (resultSetUtils.next()) {
                int utilResult = resultSetUtils.getInt(1);
                util = utilResult;
                }*/
                
                // Agregamos el usuario a la lista
                //  respuestas 
                respuestas.add(new RespuestaModel(contenido, id, imagenRes, usuarioRes, mejor, fecha_Res));
               
            }
            
            con.close();
        } 
        
        catch (SQLException ex) 
        {
            System.out.println(ex.getMessage());
        } finally 
        {
            
            return respuestas;
        }
    }
    
}
