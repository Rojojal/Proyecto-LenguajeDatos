package com.project.Naviera.models;

import jakarta.persistence.*;

@Entity
@Table(name = "FIDE_contenedor_TB")
public class Contenedor {
    @Id
    @Column(name = "id_contenedor")
    private double idContenedor;

    @Column(name = "peso_neto")
    private double pesoNeto;

    @Column(name = "estado_contenedor")
    private String estadoContenedor;

    @Column(name = "peso_maximo")
    private double pesoMaximo;

    @Column(name = "valor_neto")
    private double valorNeto;

//    @Column(name = "id_almacen")
//    private double idAlmacen;
//
//    @Column(name = "id_buque")
//    private double idBuque;

    //Join contenedor con almacen
    @OneToOne
    @JoinColumn(name="id_almacen")
    private Almacen almacen;

    //join buque con contenedor
    @ManyToOne
    @JoinColumn(name="id_buque")
    private Buque buque;
}
/*
id_contenedor number(6,0),
    peso_neto number(5,2), -- peso en libras
    estado_contenedor varchar2(20),
    peso_maximo number(5,2),
    valor_neto number(7,4), -- valor del contenedor con la carga
    id_almacen number(6,0),
    id_buque number(6,0),
 */