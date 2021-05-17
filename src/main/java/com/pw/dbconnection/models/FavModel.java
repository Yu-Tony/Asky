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
public class FavModel {

    private String usuario;
    private int pregunta;
    private boolean fav;

    public FavModel(String usuarioPreguntaFav, int idPreguntaFav, boolean utilPreguntaFav) {
        
        this.usuario=usuarioPreguntaFav;
        this.pregunta= idPreguntaFav;
        this.fav=utilPreguntaFav;
        
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

    public boolean isFav() {
        return fav;
    }

    public void setFav(boolean fav) {
        this.fav = fav;
    }
    

    
}
