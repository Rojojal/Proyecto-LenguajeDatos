package com.project.demo.models.empleado;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "FIDE_empleado_TB")
public class Empleado {
    @Column(name = "id_empleado")
    private double idEmpleado;

    @Column(name = "nombre")
    private String nombre;


}
/*
 id_empleado number(6,0),
    nombre varchar2(60),
 */