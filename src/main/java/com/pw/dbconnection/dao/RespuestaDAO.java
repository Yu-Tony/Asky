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
             System.out.println("entra al dao respuestas ");
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
                String profileRespuesta = null;
                boolean edit = resultSet.getBoolean("edit");
                int util=0;
                int noUtil=0;
                 
                CallableStatement statementUtils = con.prepareCall("SELECT COUNT(*) AS RUtilRowCount FROM util_respuesta WHERE respuesta = ? AND util=true");
                statementUtils.setInt(1, id);
                ResultSet resultSetUtils = statementUtils.executeQuery();
                if (resultSetUtils.next()) {
                int utilResult = resultSetUtils.getInt(1);
                util = utilResult;
               
                }
                
                CallableStatement statementNoUtils = con.prepareCall("SELECT COUNT(*) AS RNoUtilRowCount FROM util_respuesta WHERE respuesta = ? AND util=false");
                statementNoUtils.setInt(1, id);
                ResultSet resultSetNoUtils = statementNoUtils.executeQuery();
                if (resultSetNoUtils.next()) {
                int utilResult = resultSetNoUtils.getInt(1);
                noUtil = utilResult;
               System.out.println("No util de respuestas " + noUtil);
                }
                
                 CallableStatement statementProfilePic = con.prepareCall("SELECT profile_pic FROM Usuario where username = ?");
                statementProfilePic.setString(1, usuarioRes);
                ResultSet resultSetProfilePic = statementProfilePic.executeQuery();
                if (resultSetProfilePic.next()) {
                String commentResult = resultSetProfilePic.getString("profile_pic");
                profileRespuesta = commentResult;
                
                //System.out.println(ProfilePic);
                }
                
                // Agregamos el usuario a la lista
                //  respuestas 
                //String contenido, int id, String imagen, String usuario, Boolean mejor, Date fecha, int util, boolean editRespuesta , String profileRespuesta
                respuestas.add(new RespuestaModel(contenido, id, imagenRes, usuarioRes, mejor, fecha_Res,util, noUtil,edit, profileRespuesta));
               
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
    
    public static int insertRespuesta(RespuestaModel myRespuesta){
                    Connection con =null;
          try{
              System.out.println("Lo intentamos ");
            con = DbConnection.getConnection();
            ////id, contenido, imagen, mejor, usuario, pregunta, fecha, edit
            CallableStatement statement = con.prepareCall("insert into Respuesta(contenido, imagen, mejor, usuario, pregunta, fecha, edit, eliminar) values (?,?,?,?,?,?,?,?)");
            statement.setString(1, myRespuesta.getContenido());
            statement.setString(2, myRespuesta.getImagen());
            statement.setBoolean(3, myRespuesta.isMejor());
            statement.setString(4, myRespuesta.getUsuario());  
            statement.setInt(5, myRespuesta.getPregunta());
            statement.setDate(6, myRespuesta.getFecha_Respuesta());
             statement.setBoolean(7, myRespuesta.isEditRespuesta());
              statement.setBoolean(8, myRespuesta.isEliminarRespuesta());
            return statement.executeUpdate();
          }catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("pero no pudo funcionar");
          } finally {
              try{
              con.close();
              }catch(SQLException ex){}
              
              
          }
        return 0;
    }
    
     public static List<RespuestaModel> getRespuestasByUser(String idUser){
         List<RespuestaModel> respuestas = new ArrayList<>();
         Connection con = null;
         
        try 
        {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("select * from Respuesta where usuario = ?");
            statement.setString(1, idUser);
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
