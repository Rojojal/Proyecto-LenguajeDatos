package com.project.demo.models.rol;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "FIDE_rol_TB")
public class Rol {
    @Column(name = "id_rol")
    private double idRol;

    @Column(name = "nombre_rol")
    private String nombreRol;
}
/*
  id_rol number(6,0),
    nombre_rol varchar2(64),-- roles: usuario, administrador
 */