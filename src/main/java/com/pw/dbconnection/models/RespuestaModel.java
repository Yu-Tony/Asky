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
    
    
     public RespuestaModel(String contenido, int id, String imagen, String usuario, Boolean mejor, java.util.Date fecha, int util,int noUtil, boolean editRespuesta , String profileRespuesta){
        this.contenido = contenido;
        this.id = id;
        this.imagen = imagen;
        this.mejor = mejor;
        this.fecha_Respuesta = (Date) fecha;
        this.usuario = usuario;
        this.util=util;
        this.noUtil=noUtil;
        this.editRespuesta=editRespuesta;
        this.profileRespuesta=profileRespuesta;
        
     }

    public RespuestaModel(String contenido, String imagen, boolean mejor, String usuario, int preguntaID, java.util.Date fecha_crea, boolean edit, boolean delete) {
        this.contenido = contenido;
        this.imagen=imagen;
        this.mejor = mejor;
        this.usuario = usuario;
        this.pregunta=preguntaID;
        this.fecha_Respuesta= (Date) fecha_crea;
        this.editRespuesta=edit;
        this.eliminarRespuesta=delete;
        
        
    }

    public boolean isEliminarRespuesta() {
        return eliminarRespuesta;
    }

    public void setEliminarRespuesta(boolean eliminarRespuesta) {
        this.eliminarRespuesta = eliminarRespuesta;
    }

    
    public int getGetPregunta() {
        return getPregunta;
    }

    public void setGetPregunta(int getPregunta) {
        this.getPregunta = getPregunta;
    }

    public int getPregunta() {
        return pregunta;
    }

    public void setPregunta(int pregunta) {
        this.pregunta = pregunta;
    }

    public int getUtil() {
        return util;
    }

    public void setUtil(int util) {
        this.util = util;
    }

    public int getNoUtil() {
        return noUtil;
    }

    public void setNoUtil(int noUtil) {
        this.noUtil = noUtil;
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
      private int noUtil;
      private boolean editRespuesta;
      private boolean eliminarRespuesta;
      private String profileRespuesta;
     

    
}