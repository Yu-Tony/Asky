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
import java.sql.SQLException;

/**
 *
 * @author teb - https://github.com/Yu-Tony
 */
public class BestDAO {
    
     public static void insertBest(int idBest, int idPregunta) 
     {
          Connection con =null;
        try {
            con = DbConnection.getConnection();
             CallableStatement statementNotBest = con.prepareCall("UPDATE respuesta SET mejor = false where pregunta = ?");
             statementNotBest.setInt(1, idPregunta);
             statementNotBest.executeUpdate();
             
             CallableStatement statementBest = con.prepareCall("UPDATE respuesta SET mejor = true where id = ?");
             statementBest.setInt(1, idBest);
             statementBest.executeUpdate();
            
       
             con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
             
        }
     }
     
       public static void deletetBest(int idPregunta) 
     {
          Connection con =null;
        try {
            con = DbConnection.getConnection();
             CallableStatement statementNotBest = con.prepareCall("UPDATE respuesta SET mejor = false where pregunta = ?");
             statementNotBest.setInt(1, idPregunta);
             statementNotBest.executeUpdate();
             
                  
             con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
             
        }
     }
    
}
