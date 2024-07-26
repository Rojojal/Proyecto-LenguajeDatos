package com.project.Naviera.models;


import jakarta.persistence.*;


@Entity
@Table(name = "USUARIOS")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "usuario_seq_gen")
    @SequenceGenerator(name = "usuario_seq_gen", sequenceName = "usuario_seq", allocationSize = 1)
    @Column(name = "id_usuario")
    private int id_usuario;


    @Column(name = "nombre")
    private String nombre;

    @Column(name = "nombre_usuario")
    private String nombre_usuario;

    @Column(name = "email")
    private String email;


    @Column(name = "password")
    private String password;

    
    private String role;

    public String getRole() {
        return this.role;
    }

    public void setRoles(String role) {
        this.role = role;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId_usuario() {
        return this.id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

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
