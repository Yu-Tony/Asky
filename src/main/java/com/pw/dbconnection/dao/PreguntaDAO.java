/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.PreguntaModel;
import com.pw.dbconnection.models.UserModel;
import com.pw.dbconnection.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static javax.swing.JOptionPane.showMessageDialog;

/**
 *
 * @author teb - https://github.com/Yu-Tony
 */
public class PreguntaDAO {
    
     public static List<PreguntaModel> getPreguntas(String start1){
         List<PreguntaModel> preguntas = new ArrayList<>();
         Connection con=null;
         
        try 
        {
            int pageid1=Integer.parseInt(start1);  
            pageid1 = pageid1-1;
           // "select * from student limit "+(start1-1)+","+total1
                    
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("SELECT * FROM Pregunta LIMIT ?,10");
            statement.setInt(1, pageid1);
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos

            
             
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
            
             
                String contenido = resultSet.getString("contenido");
                 //System.out.println("page number DAO " + contenido);
                int id = resultSet.getInt("id");
                String descripcion = resultSet.getString("descripcion");
                String imagenPregunta = resultSet.getString("imagen");
                String usuarioPregunta = resultSet.getString("usuario");
                int categoriaPreguntaID = resultSet.getInt("categoria");
                String categoriaPregunta = null;
                Date fecha_Pregunta = resultSet.getDate("fecha");
                int fav=0;
                int util=0;
                int comentarios=0;
            
                 //http://www.java2s.com/Code/Java/Database-SQL-JDBC/CountRecordsUsingPreparedStatement.htm
                CallableStatement statementFavs = con.prepareCall("SELECT COUNT(*) AS FavRowCount FROM fav_pregunta WHERE pregunta = ?");
                statementFavs.setInt(1, id);
                ResultSet resultSetFavs = statementFavs.executeQuery();
                if (resultSetFavs.next()) {
                int favResult = resultSetFavs.getInt(1);
                fav=favResult;
                }
                
                CallableStatement statementUtils = con.prepareCall("SELECT COUNT(*) AS UtilRowCount FROM util_pregunta WHERE pregunta = ?");
                statementUtils.setInt(1, id);
                ResultSet resultSetUtils = statementUtils.executeQuery();
                if (resultSetUtils.next()) {
                int utilResult = resultSetUtils.getInt(1);
                util = utilResult;
                }
                
                CallableStatement statementCateg = con.prepareCall("SELECT nombre FROM Categoria WHERE id = ?");
                statementCateg.setInt(1, categoriaPreguntaID);
                ResultSet resultSetCateg = statementCateg.executeQuery();
                if (resultSetCateg.next()) {
                String CategResult = resultSetCateg.getString("nombre");
                //System.out.println(CategResult);
                categoriaPregunta = CategResult;
                }
                
              CallableStatement statementComment = con.prepareCall("SELECT COUNT(*) AS CommentRowCount FROM Respuesta WHERE pregunta = ?");
                statementComment.setInt(1, id);
                ResultSet resultSetComment = statementComment.executeQuery();
                if (resultSetComment.next()) {
                int commentResult = resultSetComment.getInt(1);
                comentarios = commentResult;
                }
                
                // Agregamos el usuario a la lista
                preguntas.add(new PreguntaModel(contenido, id, descripcion, imagenPregunta, usuarioPregunta, categoriaPregunta, fecha_Pregunta, fav, util,comentarios));
                
               
            }
            
             con.close();
        } 
        
        catch (SQLException ex) 
        {
            System.out.println(ex.getMessage());
        } finally 
        {
            
            return preguntas;
        }
     }
    
      public static List<PreguntaModel> buscarPregunta(String aBuscar, String start1){
                   List<PreguntaModel> preguntas = new ArrayList<>();
         
        try 
        {
            int pageid1=Integer.parseInt(start1);  
            pageid1 = pageid1-1;
            
            Connection con = DbConnection.getConnection();
             System.out.println("Llego");
             System.out.println(aBuscar);
             String pstmt;
            
            CallableStatement statement = con.prepareCall("select * from pregunta where contenido like ? limit ?,10");
            statement.setString(1,  "%" + aBuscar + "%");
            statement.setInt(2, pageid1);
            ResultSet resultSet = statement.executeQuery();
           
            System.out.println("busqueda page " + pageid1);
            // Si el resultSet tiene resultados lo recorremos

            
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
                
                String contenido = resultSet.getString("contenido");
                int id = resultSet.getInt("id");
                String descripcion = resultSet.getString("descripcion");
                String imagenPregunta = resultSet.getString("imagen");
                String usuarioPregunta = resultSet.getString("usuario");
                //System.out.println(usuarioPregunta);
                int categoriaPreguntaID = resultSet.getInt("categoria");
                String categoriaPregunta = null;
                Date fecha_Pregunta = resultSet.getDate("fecha");
                int fav=0;
                int util=0;
                int comentarios=0;
            
                 //http://www.java2s.com/Code/Java/Database-SQL-JDBC/CountRecordsUsingPreparedStatement.htm
                CallableStatement statementFavs = con.prepareCall("SELECT COUNT(*) AS FavRowCount FROM fav_pregunta WHERE pregunta = ?");
                statementFavs.setInt(1, id);
                ResultSet resultSetFavs = statementFavs.executeQuery();
                if (resultSetFavs.next()) {
                int favResult = resultSetFavs.getInt(1);
                fav=favResult;
                }
                
                CallableStatement statementUtils = con.prepareCall("SELECT COUNT(*) AS UtilRowCount FROM util_pregunta WHERE pregunta = ?");
                statementUtils.setInt(1, id);
                ResultSet resultSetUtils = statementUtils.executeQuery();
                if (resultSetUtils.next()) {
                int utilResult = resultSetUtils.getInt(1);
                util = utilResult;
                }
                
                CallableStatement statementCateg = con.prepareCall("SELECT nombre FROM Categoria WHERE id = ?");
                statementCateg.setInt(1, categoriaPreguntaID);
                ResultSet resultSetCateg = statementCateg.executeQuery();
                if (resultSetCateg.next()) {
                String CategResult = resultSetCateg.getString("nombre");
                //System.out.println(CategResult);
                categoriaPregunta = CategResult;
                }
                
              CallableStatement statementComment = con.prepareCall("SELECT COUNT(*) AS CommentRowCount FROM Respuesta WHERE pregunta = ?");
                statementComment.setInt(1, id);
                ResultSet resultSetComment = statementComment.executeQuery();
                if (resultSetComment.next()) {
                int commentResult = resultSetComment.getInt(1);
                comentarios = commentResult;
                }
                
                // Agregamos el usuario a la lista
                preguntas.add(new PreguntaModel(contenido, id, descripcion, imagenPregunta, usuarioPregunta, categoriaPregunta, fecha_Pregunta, fav, util,comentarios));
                
               
            }
             con.close();
        } catch (SQLException ex) 
        {
            System.out.println(ex.getMessage());
        } finally 
        {
            return preguntas;
        }
      }
      
      public static PreguntaModel idPregunta(int myid){
        PreguntaModel miPregunta = null;
  
        try{
            Connection con = DbConnection.getConnection();
;
            
            CallableStatement statement = con.prepareCall("select * from Pregunta where id = ?");
            statement.setInt(1, myid);
            ResultSet resultSet = statement.executeQuery();
           
            // Si el resultSet tiene resultados lo recorremos

            
            while (resultSet.next()) {
                
                String contenido = resultSet.getString("contenido");
                int id = resultSet.getInt("id");
                String descripcion = resultSet.getString("descripcion");
                String imagenPregunta = resultSet.getString("imagen");
                String usuarioPregunta = resultSet.getString("usuario");
                System.out.println(usuarioPregunta);
                int categoriaPreguntaID = resultSet.getInt("categoria");
                String categoriaPregunta = null;
                Date fecha_Pregunta = resultSet.getDate("fecha");
                int fav=0;
                int util=0;
                int comentarios=0;
            
                 //http://www.java2s.com/Code/Java/Database-SQL-JDBC/CountRecordsUsingPreparedStatement.htm
                CallableStatement statementFavs = con.prepareCall("SELECT COUNT(*) AS FavRowCount FROM fav_pregunta WHERE pregunta = ?");
                statementFavs.setInt(1, id);
                ResultSet resultSetFavs = statementFavs.executeQuery();
                if (resultSetFavs.next()) {
                int favResult = resultSetFavs.getInt(1);
                fav=favResult;
                }
                
                CallableStatement statementUtils = con.prepareCall("SELECT COUNT(*) AS UtilRowCount FROM util_pregunta WHERE pregunta = ?");
                statementUtils.setInt(1, id);
                ResultSet resultSetUtils = statementUtils.executeQuery();
                if (resultSetUtils.next()) {
                int utilResult = resultSetUtils.getInt(1);
                util = utilResult;
                }
                
                CallableStatement statementCateg = con.prepareCall("SELECT nombre FROM Categoria WHERE id = ?");
                statementCateg.setInt(1, categoriaPreguntaID);
                ResultSet resultSetCateg = statementCateg.executeQuery();
                if (resultSetCateg.next()) {
                String CategResult = resultSetCateg.getString("nombre");
                //System.out.println(CategResult);
                categoriaPregunta = CategResult;
                }
                
              CallableStatement statementComment = con.prepareCall("SELECT COUNT(*) AS CommentRowCount FROM Respuesta WHERE pregunta = ?");
                statementComment.setInt(1, id);
                ResultSet resultSetComment = statementComment.executeQuery();
                if (resultSetComment.next()) {
                int commentResult = resultSetComment.getInt(1);
                comentarios = commentResult;
                }
                
                // Agregamos el usuario a la lista
                miPregunta = new PreguntaModel(contenido, id, descripcion, imagenPregunta, usuarioPregunta, categoriaPregunta, fecha_Pregunta, fav, util,comentarios);
            }
            //con.close();
        }
        catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        finally{
            
            return miPregunta;
        }
        
        
      }
      
      public static int insertPregunta(PreguntaModel myPregunta){
            Connection con =null;
          try{
              System.out.println("Lo intentamos ");
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("insert into Pregunta(contenido, categoria, usuario, descripcion, fecha) values (?,?,?,?,?)");
            statement.setString(1, myPregunta.getContenido());
            statement.setInt(2, myPregunta.getCatId());
            statement.setString(3, myPregunta.getUsuarioPregunta());
            statement.setString(4, myPregunta.getDescripcion());
            statement.setDate(5, myPregunta.getFecha_Pregunta());
            return statement.executeUpdate();
          }catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("pero no pudo funcionar");
          } finally {
              try{
              con.close();
              }catch(SQLException ex){}
              
               try
            {
                  con.close();
            }
            catch(SQLException e)
            {
                 System.out.println(e.getMessage());
            }
          }
            
      
        return 0;
      }
}


