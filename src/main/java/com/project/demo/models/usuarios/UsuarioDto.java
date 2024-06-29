package com.project.demo.models.usuarios;

import jakarta.validation.constraints.*;

public class UsuarioDto {

    @NotEmpty(message = "The name is required")
    private String nombre;

    @NotEmpty(message = "The username is required")
    private String nombre_usuario;

    @NotEmpty(message = "The password is required")
    private String password;

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre_usuario() {
        return this.nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
