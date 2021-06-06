/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.LikeModel;

import com.pw.dbconnection.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author teb - https://github.com/Yu-Tony
 */
public class LikeDAO {
    public static int insertLike(LikeModel like) {
         Connection con =null;
        try {
            con = DbConnection.getConnection();
            // En el proyecto solo podran hacer uso de Store Procedures
            // No llamadas directas como esta
            // Esta linea prepara la llamada a la base de datos para insertar
            // Cada ? significa un valor a ser remplazado
            
            CallableStatement statementLook = con.prepareCall("SELECT * FROM util_pregunta WHERE usuario = ? AND pregunta = ?");
            statementLook.setString(1, like.getUsuario());
            statementLook.setInt(2, like.getPregunta());
            
            ResultSet resultSet = statementLook.executeQuery();
            if (resultSet.next()) {
                String contenido = resultSet.getString("usuario");
                System.out.println(contenido);
                
                String query = "delete from util_pregunta where usuario = ? AND pregunta = ?";
                PreparedStatement preparedStmt = con.prepareStatement(query);
                preparedStmt.setString(1, like.getUsuario());
                preparedStmt.setInt(2, like.getPregunta());
                preparedStmt.execute();
                /*CallableStatement statementDel = con.prepareCall("");
                statementDel.setString(1, like.getUsuario());
                statementDel.setInt(2, like.getPregunta());
                ResultSet resultSetDel = statementDel.executeQuery();*/
            } else {
                // Quest not completed yet
            }


   
            
            CallableStatement statement = con.prepareCall("insert into util_pregunta(usuario, pregunta, util) VALUES (?,?,?)");
            statement.setString(1, like.getUsuario());
            statement.setInt(2, like.getPregunta());
            statement.setBoolean(3, like.isUtil());

            // Ejecuta el Statement y retorna cuantos registros
            // fueron actualizados
            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
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

    public static int deleteLike(LikeModel like)
    {
         Connection con = null;
         try {
            con = DbConnection.getConnection();
            // En el proyecto solo podran hacer uso de Store Procedures
            // No llamadas directas como esta
            // Esta linea prepara la llamada a la base de datos para insertar
            // Cada ? significa un valor a ser remplazado
            CallableStatement statement = con.prepareCall("delete from util_pregunta where usuario = ? and pregunta = ?");
           
            statement.setString(1, like.getUsuario());
            statement.setInt(2, like.getPregunta());
           

            // Ejecuta el Statement y retorna cuantos registros
            // fueron actualizados
            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
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

