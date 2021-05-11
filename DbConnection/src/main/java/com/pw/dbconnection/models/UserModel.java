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
public class UserModel {

    private String nombre;
    private String apellidos;
    private Date fecha_nac;
    private String correo;
    private boolean estado;
    private String profile_pic;
    private String username;
    private String contrasena;
    private Date fecha_crea;


    public UserModel(String nombre, String apellidos, java.util.Date fecha_nac, String correo, boolean estado, String profile_pic, String username, String contrasena) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.fecha_nac = (Date) fecha_nac;
        this.correo = correo;
        this.estado = estado;
        this.profile_pic = profile_pic;
        this.username = username;
        this.contrasena = contrasena;
    }

 


    public UserModel(String nombre, String apellidos, java.util.Date fecha_nac, String correo, Boolean estado,  String profile_pic, String username, String contrasena, java.util.Date fecha_crea) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.fecha_nac = (Date) fecha_nac;
        this.correo = correo;
        this.estado = estado;
        this.profile_pic = profile_pic;
        this.username = username;
        this.contrasena = contrasena;
        this.fecha_crea = (Date) fecha_crea;
    }

    public UserModel(String nombre, String apellidos, String profile_pic) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setFecha_nac(Date fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public void setProfile_pic(String profile_pic) {
        this.profile_pic = profile_pic;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public Date getFecha_nac() {
        return fecha_nac;
    }

    public String getCorreo() {
        return correo;
    }

    public boolean isEstado() {
        return estado;
    }

    public String getProfile_pic() {
        return profile_pic;
    }

    public String getUsername() {
        return username;
    }

    public String getContrasena() {
        return contrasena;
    }

    public Date getFecha_crea() {
        return fecha_crea;
    }

    public void setFecha_crea(Date fecha_crea) {
        this.fecha_crea = fecha_crea;
    }
   



}
