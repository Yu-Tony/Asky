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
public class PreguntaModel {

    public PreguntaModel(String contenido, int id, String descripcion, String imagenPregunta, String usuarioPregunta, String categoriaPregunta, Date fecha_Pregunta, int fav, int util, int comentarios) {      
       this.contenido = contenido;
       this.id=id;
       this.descripcion=descripcion;
       this.imagenPregunta=imagenPregunta;
       this.usuarioPregunta=usuarioPregunta;
       this.categoriaPregunta=categoriaPregunta;
       this.fecha_Pregunta=fecha_Pregunta;
       this.fav=fav;
       this.util=util;
       this.comentarios = comentarios;
    }
    
    public PreguntaModel(String titulo, String contenido, String username, int categoria, java.util.Date fecha){
        this.contenido = titulo;
        this.descripcion = contenido;
        this.usuarioPregunta = username;
        this.categoria_id = categoria;
        this.fecha_Pregunta = (Date) fecha;
    }

    public int getComentarios() {
        return comentarios;
    }

    public void setComentarios(int comentarios) {
        this.comentarios = comentarios;
    }

    public int getFav() {
        return fav;
    }

    public void setFav(int fav) {
        this.fav = fav;
    }

    public int getUtil() {
        return util;
    }

    public void setUtil(int util) {
        this.util = util;
    }


    public Date getFecha_Pregunta() {
        return fecha_Pregunta;
    }

    public void setFecha_Pregunta(Date fecha_Pregunta) {
        this.fecha_Pregunta = fecha_Pregunta;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagenPregunta() {
        return imagenPregunta;
    }

    public void setImagenPregunta(String imagenPregunta) {
        this.imagenPregunta = imagenPregunta;
    }

    public String getUsuarioPregunta() {
        return usuarioPregunta;
    }

    public void setUsuarioPregunta(String usuarioPregunta) {
        this.usuarioPregunta = usuarioPregunta;
    }

    public String getCategoriaPregunta() {
        return categoriaPregunta;
    }

    public void setCategoriaPregunta(String categoriaPregunta) {
        this.categoriaPregunta = categoriaPregunta;
    }
    
    public int getCatId(){
        return categoria_id;
    }
    
    public void setCatId(int catid){
        this.categoria_id = catid;
    }
    
    private String contenido;
    private int id;
    private String descripcion;
    private String imagenPregunta;
    private String usuarioPregunta;
    private String categoriaPregunta;
    private Date fecha_Pregunta;
    private int fav;
    private int util;
    private int comentarios;
    private int categoria_id;

}
