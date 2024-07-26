package com.project.Naviera.models;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "FIDE_pais_TB")
public class Pais {
    @Id
    @Column(name = "id_pais")
    private double idPais;

    @Column(name = "nombre_pais")
    private String nombrePais;

}
/*
id_pais number(6,0),
    nombre_pais varchar2(60),
 */