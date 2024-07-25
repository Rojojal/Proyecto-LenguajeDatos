package com.project.demo.models.detalle;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "FIDE_detalle_TB")
public class Detalle {
    @Id
    @Column(name = "id_detalle")
    private double idDetalle;

    @Column(name = "color")
    private String color;

    @Column(name = "tamaño")
    private String tamaño;
}
/*
id_detalle number(6,0),
    color varchar2(30),
    tamaño varchar2(64),
 */