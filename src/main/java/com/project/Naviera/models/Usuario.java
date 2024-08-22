package com.project.Naviera.models;

import jakarta.persistence.*;

@Entity
@Table(name = "FIDE_USUARIO_TB")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    @Column(name = "nacionalidad")
    private String nacionalidad;

    @Column(name = "ruta_imagen")
    private String rutaImagen;

    @ManyToOne
    @JoinColumn(name = "id_rol")
    private Rol idrol;

    // Getters and Setters
    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
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
        return idrol;
    }

    public void setRol(Rol idrol) {
        this.idrol = idrol;
    }
}
