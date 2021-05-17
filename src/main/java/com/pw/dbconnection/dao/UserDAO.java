/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.UserModel;
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
 * @author magoc
 */
public class UserDAO {

    // Query de creacion de Tabla
    /**
     * CREATE TABLE `user` ( `idUser` INT NOT NULL AUTO_INCREMENT, `nameUser`
     * VARCHAR(45) NULL, `password` VARCHAR(45) NULL, `urlImage` VARCHAR(255)
     * NULL, PRIMARY KEY (`idUser`));
     *
     */
    /**
     * Inserta un usuario en la base de datos
     *
     * @param user
     * @return
     */
    public static int insertUser(UserModel user) {
        try {
            Connection con = DbConnection.getConnection();
            // En el proyecto solo podran hacer uso de Store Procedures
            // No llamadas directas como esta
            // Esta linea prepara la llamada a la base de datos para insertar
            // Cada ? significa un valor a ser remplazado
            CallableStatement statement = con.prepareCall("INSERT INTO Usuario (nombre,apellidos,fecha_nac,correo,estado,profile_pic,username,contrasena,fecha_crea) VALUES (?,?,?,?,?,?,?,?,?)");
            
            statement.setString(1, user.getNombre());
            statement.setString(2, user.getApellidos());
            statement.setDate(3, user.getFecha_nac());
            statement.setString(4, user.getCorreo());
            statement.setBoolean(5, user.isEstado());
            statement.setString(6, user.getProfile_pic());
            statement.setString(7, user.getUsername());
            statement.setString(8, user.getContrasena());
            statement.setDate(9, user.getFecha_crea());
            // Ejecuta el Statement y retorna cuantos registros
            // fueron actualizados
            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        }
        return 0;
    }

    public static List<UserModel> getUsers() {
        List<UserModel> users = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("SELECT * FROM Usuario");
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
            

                String nombre = resultSet.getString("nombre");
                String apellidos = resultSet.getString("apellidos");
                Date fecha_nac = resultSet.getDate("fecha_nac");
                String correo = resultSet.getString("correo");
                Boolean estado = resultSet.getBoolean("estado");
                String profile_pic = resultSet.getString("profile_pic");
                String username = resultSet.getString("username");
                String contrasena = resultSet.getString("contrasena");
              
                
                // Agregamos el usuario a la lista
                users.add(new UserModel(nombre, apellidos, fecha_nac, correo, estado, profile_pic, username, contrasena));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            return users;
        }
    }
}
