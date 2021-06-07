package com.pw.dbconnection.utils;

import java.sql.*;
import org.apache.commons.dbcp.BasicDataSource;

/**
 * Esta clase nos ayuda a crear la conexion a la base de datos
 *
 * 
 */
public class DbConnection {

    // Creamos el objeto conexion
    private static final BasicDataSource dataSource = new BasicDataSource();

    // Inicializamos la conexion
    static {
        // Tipo de Driver, este es el de mysql
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        // La URL a la conexion, especificando que es de mysql
        // la ruta que es localhost puerto 3306
        // el nombre de la base de datos que es PrograWebDB
        dataSource.setUrl("jdbc:mysql://localhost:3306/PrograWebDB?useUnicode=true&useJDBCCompliantTimeZoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
        // El nombre de usuario
        dataSource.setUsername("root");
        // La contraseña
  dataSource.setPassword("tugfa123");
    }

    /**
     * *
     * Metodo para obtener la conexion
     *
     * @return Conexion a Base de datos
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    /**
     * Metodo para cerrar la conexion
     *
     * @throws SQLException
     */
    public static void closeConnection() throws SQLException {
        dataSource.close();
    }
}
