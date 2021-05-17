/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.CategoriaModel;
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
 * @author teb - https://github.com/Yu-Tony
 */
public class CategoriaDAO {
    
    public static List<CategoriaModel> getCategorias(){
             
         List<CategoriaModel> categorias = new ArrayList<>();
         
        try 
        {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("select * from Categoria");
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos

            
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
            
                String nombreCategoria = resultSet.getString("nombre");
        
                
                // Agregamos el usuario a la lista
                categorias.add(new CategoriaModel(nombreCategoria));
            }
        } catch (SQLException ex) 
        {
            System.out.println(ex.getMessage());
        } finally 
        {
            return categorias;
        }
     }
    
    
}
