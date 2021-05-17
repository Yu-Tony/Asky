/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.models;

import java.sql.Date;

/**
 *
 * @author teb
 */
public class RespuestaModel {

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public boolean isMejor() {
        return mejor;
    }

    public void setMejor(boolean mejor) {
        this.mejor = mejor;
    }

    public Date getFecha_Respuesta() {
        return fecha_Respuesta;
    }

    public void setFecha_Respuesta(Date fecha_Respuesta) {
        this.fecha_Respuesta = fecha_Respuesta;
    }
    
      private int id;
      private String contenido;
      private String imagen;
      private boolean mejor;
      private Date fecha_Respuesta;

    
}
