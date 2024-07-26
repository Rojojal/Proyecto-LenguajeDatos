package com.project.Naviera.models;


import jakarta.persistence.*;


@Entity
@Table(name = "FIDE_rol_TB")
public class Usuario {

    @Id
    @Column(name = "id_usuario")
    private int idUsuario;


    @Column(name = "primer_nombre")
    private String primerNombre;

    @Column(name = "apellido")
    private String apellido;

    @Column(name = "username")
    private String username;


    @Column(name = "contraseña")
    private String contraseña;

    @Column(name = "email")
    private String email;

//    @Column(name = "id_rol")
//    private String idRol;

    @Column(name = "nacionalidad")
    private String nacionalidad;

    @Column(name = "ruta_imagen")
    private String rutaImagen;

    //join de la tabla rol al id rol
    @OneToOne
    @JoinColumn(name="id_rol")
    private Rol rol;

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int id_usuario) {
        this.idUsuario = id_usuario;
    }

    public String getPrimerNombre() {
        return primerNombre;
    }

    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getRutaImagen() {
        return rutaImagen;
    }

    public void setRutaImagen(String rutaImagen) {
        this.rutaImagen = rutaImagen;
    }

    public Rol getRol() {
        return rol;
    }



    public void setRol(Rol rol) {
        this.rol = rol;
    }
}
/*
 id_usuario number(6,0),
    primer_nombre varchar2(30),
    apellido varchar2(30),
    username varchar2(64),
    contraseña varchar2(128),
    email varchar2(256),
    id_rol number(6,0),
    nacionalidad varchar2(30),
    ruta_imagen varchar2(1024),
    CONSTRAINT FIDE_usuario_TB_id_usuario_pk PRIMARY KEY (id_usuario),
    CONSTRAINT FIDE_usuario_TB_id_rol_fk FOREIGN KEY (id_rol) REFERENCES G8admin.FIDE_rol_TB(id_rol)
 */