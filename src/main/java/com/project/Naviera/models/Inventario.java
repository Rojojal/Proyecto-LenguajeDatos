package com.project.Naviera.models;
import jakarta.persistence.*;

@Entity
@Table(name = "FIDE_inventario_TB")
public class Inventario {
    @Id
    @Column(name = "id_inventario")
    private long idInventario;

    @Column(name = "ubicacion")
    private String ubicacion;

    @Column(name = "cantidad")
    private int cantidad;

//    @Column(name = "id_producto")
//    private double idProducto;

    //Join tabla producto con inventario
    @ManyToOne
    @JoinColumn(name="id_producto")
    private Producto producto;
}
/*
id_inventario number(6,0),
    ubicacion varchar2(30),
    cantidad number(8,0),
    id_producto number(6,0),
 */