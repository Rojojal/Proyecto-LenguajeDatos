package com.project.Naviera.models;

import jakarta.persistence.*;

@Entity
@Table(name = "FIDE_USUARIO_TB")
public class UsuarioDto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_usuario")
    private Long idUsuario;  

    @Column(name = "primer_nombre")
    private String primerNombre;

    private String apellido;

    private String username;

    private String contraseña;

    private String email;

    private String nacionalidad;

    @Column(name = "ruta_imagen")
    private String rutaImagen;

    private Long  idrol;

    // Getters and Setters
    public Long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getPrimerNombre() {
        return this.primerNombre;
    }

    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }

    public String getApellido() {
        return this.apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContraseña() {
        return this.contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNacionalidad() {
        return this.nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getRutaImagen() {
        return this.rutaImagen;
    }

    public void setRutaImagen(String rutaImagen) {
        this.rutaImagen = rutaImagen;
    }
    //cambios
   // Additional getter and setter for role ID
   public Long getRolId() {
    return idrol;
}

public void setRolId(Long idrol) {
    this.idrol = idrol;
}
}
