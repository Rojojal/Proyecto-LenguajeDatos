package com.project.Naviera.models;
import jakarta.persistence.*;

import java.util.List;

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


    //Join de la tabla detalle con productos
    @OneToOne
    @JoinColumn(name="id_detalle", updatable = false)
    private Producto producto;
}
/*
id_detalle number(6,0),
    color varchar2(30),
    tamaño varchar2(64),
 */