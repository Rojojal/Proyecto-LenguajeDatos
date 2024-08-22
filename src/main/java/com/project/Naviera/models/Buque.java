package com.project.Naviera.models;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "FIDE_buque_TB")
public class Buque {
    @Id
    @Column(name = "id_buque")
    private long idBuque;

    @Column(name = "nombre_barco")
    private String nombreBarco;

    @Column(name = "capacidad_maxima")
    private double capacidadMaxima;

//    @Column(name = "id_empleado")
//    private double idEmpleado;
//
//    @Column(name = "id_capitan")
//    private double idCapitan;

    //join empleado con buque
    @OneToMany
    @JoinColumn(name="id_empleado", updatable = false)
    private List<Empleado> empleados;

    //join capian con buque
    @OneToOne
    @JoinColumn(name="id_capitan")
    private Capitan capitan;

}
/*
    id_buque number(6,0),
    nombre_barco varchar2(20),
    estado_buque varchar2(20),
    capacidad_maxima number(7,5), -- peso en libras
    id_empleado number(6,0),
    id_capitan number(6,0),
    CONSTRAINT FIDE_buque_TB_id_buque_pk PRIMARY KEY (id_buque),
    CONSTRAINT FIDE_buque_TB_id_empleado_fk FOREIGN KEY (id_empleado) REFERENCES G8admin.FIDE_empleado_TB(id_empleado),
    CONSTRAINT FIDE_buque_TB_id_capitan_fk FOREIGN KEY (id_capitan) REFERENCES G8admin.FIDE_capitan_TB(id_capitan)
 */