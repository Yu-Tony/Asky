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

    public int getPregunta;
    
    
     public RespuestaModel(String contenido, int id, String imagen, String usuario, Boolean mejor, Date fecha, int util, boolean editRespuesta , String profileRespuesta){
        this.contenido = contenido;
        this.id = id;
        this.imagen = imagen;
        this.mejor = mejor;
        this.fecha_Respuesta = fecha;
        this.usuario = usuario;
        this.util=util;
        this.editRespuesta=editRespuesta;
        this.profileRespuesta=profileRespuesta;
        
    }

    public int getUtil() {
        return util;
    }

    public void setUtil(int util) {
        this.util = util;
    }

    public int getNoutil() {
        return Noutil;
    }

    public void setNoutil(int Noutil) {
        this.Noutil = Noutil;
    }

    public boolean isEditRespuesta() {
        return editRespuesta;
    }

    public void setEditRespuesta(boolean editRespuesta) {
        this.editRespuesta = editRespuesta;
    }

    public String getProfileRespuesta() {
        return profileRespuesta;
    }

    public void setProfileRespuesta(String profileRespuesta) {
        this.profileRespuesta = profileRespuesta;
    }
    
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
    
    public void setUsuario(String usuario){
        this.usuario = usuario;
    }
    
    public String getUsuario(){
        return usuario;
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
    
    public int getPreguntaId(){
        return pregunta;
    }
    
    public void setPreguntaId(int idPreg){
        this.pregunta = idPreg;
    }
    
      private int id;
      private String contenido;
      private int pregunta;
      private String usuario;
      private String imagen;
      private boolean mejor;
      private Date fecha_Respuesta;
      private int util;
      private int Noutil;
      private boolean editRespuesta;
      private String profileRespuesta;
     

    
}