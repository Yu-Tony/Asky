/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.models;

/**
 *
 * @author teb - https://github.com/Yu-Tony
 */
public class LikeModel {

    private String usuario;
    private int pregunta;
    private boolean util;
    
    public LikeModel(String usuario, int pregunta, boolean util) {
        this.usuario=usuario;
        this.pregunta=pregunta;
        this.util=util;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getPregunta() {
        return pregunta;
    }

    public void setPregunta(int pregunta) {
        this.pregunta = pregunta;
    }

    public boolean isUtil() {
        return util;
    }

    public void setUtil(boolean util) {
        this.util = util;
    }
    

  
    
    
}
