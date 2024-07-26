package com.project.Naviera.models;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "FIDE_inventario_TB")
public class Inventario {
    @Id
    @Column(name = "id_inventario")
    private double idInventario;

    @Column(name = "ubicacion")
    private String ubicacion;

    @Column(name = "cantidad")
    private int cantidad;

    @Column(name = "id_producto")
    private double idProducto;
}
/*
id_inventario number(6,0),
    ubicacion varchar2(30),
    cantidad number(8,0),
    id_producto number(6,0),
 */