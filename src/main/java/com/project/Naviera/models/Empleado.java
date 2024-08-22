package com.project.Naviera.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "FIDE_empleado_TB")
public class Empleado {
    @Id
    @Column(name = "id_empleado")
    private long idEmpleado;

    @Column(name = "nombre")
    private String nombre;


}
/*
 id_empleado number(6,0),
    nombre varchar2(60),
 */