//package com.project.Naviera.models;
//
//import jakarta.validation.constraints.Email;
//import jakarta.validation.constraints.NotEmpty;
//import jakarta.validation.constraints.Size;
//
//public class RegisterDto {
//
//    @NotEmpty(message = "The name is required")
//    private String nombre;
//
//    @NotEmpty(message = "The username is required")
//    private String nombreUsuario;
//
//    @NotEmpty(message = "The email is required")
//    @Email
//    private String email;
//
//    @Size(min = 6,  message = "Minium Password lenght is 6 characters")
//    private String password;
//
//    private String role;
//
//    public String getRole() {
//        return this.role;
//    }
//
//    public void setRole(String role) {
//        this.role = role;
//    }
//
//    private String confirmPassword;
//
//    public String getConfirmPassword() {
//        return this.confirmPassword;
//    }
//
//    public void setConfirmPassword(String confirmPassword) {
//        this.confirmPassword = confirmPassword;
//    }
//
//    public String getNombre() {
//        return this.nombre;
//    }
//
//    public void setNombre(String nombre) {
//        this.nombre = nombre;
//    }
//
//    public String getEmail() {
//        return this.email;
//    }
//
//    public void setEmail(String email) {
//        this.email = email;
//    }
//
//    public String getNombreUsuario() {
//        return this.nombreUsuario;
//    }
//
//    public void setNombreUsuario(String nombreUsuario) {
//        this.nombreUsuario = nombreUsuario;
//    }
//
//    public String getPassword() {
//        return this.password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//}
