
package com.project.Naviera.models;
/* 
import jakarta.persistence.*;


@Entity
@Table(name = "USUARIOS")
public class Registrar {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "usuario_seq_gen")
    @SequenceGenerator(name = "usuario_seq_gen", sequenceName = "usuario_seq", allocationSize = 1)
    @Column(name = "id_usuario")
    private int id_usuario;

    private String nombre;

    private String role;

    public String getRole() {
        return this.role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    private String email;

    @Column(name = "nombre_usuario")
    private String nombreUsuario;


    private String password;

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

    public String getNombreUsuario() {
        return this.nombreUsuario;
    }

    public void setnombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}


