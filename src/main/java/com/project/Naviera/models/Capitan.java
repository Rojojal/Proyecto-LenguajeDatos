package com.project.Naviera.models;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "FIDE_capitan_TB")
public class Capitan {
    @Id
    @Column(name = "id_capitan")
    private double idCapitan;

    @Column(name = "edad_capitan")
    private double edadCapitan;

    @Column(name = "fecha_nacimiento")
    private Date fechaNacimiento;

    @Column(name = "años_experiencia")
    private double añosExperiencia;

    @Column(name = "fecha_inicio_cargo")
    private Date fechaInicioCargo;

//    @Column(name = "id_pais")
//    private double idPais;

    //join pais con destino
    @OneToOne
    @JoinColumn(name="id_pais")
    private Pais pais;
}
/*
    id_capitan number(6,0),
    nombre_barco varchar2(20),
    edad_capitan number(2,1),
    fecha_nacimiento date,
    años_experiencia number(2,1),
    fecha_inicio_cargo date,
    id_pais number(6,0),
    CONSTRAINT FIDE_capitan_TB_id_capitan_pk PRIMARY KEY (id_capitan),
    CONSTRAINT FIDE_capitan_TB_id_pais_fk FOREIGN KEY (id_pais) REFERENCES G8admin.FIDE_pais_TB(id_pais)
 */