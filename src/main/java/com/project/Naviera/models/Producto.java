package com.project.Naviera.models;

import jakarta.persistence.*;


@Entity
@Table(name = "FIDE_producto_TB")
public class Producto {
    @Id
    @Column(name = "id_producto")
    private double idProducto;

    @Column(name = "id_categoria")
    private double idCategoria;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "precio")
    private double precio;

    @Column(name = "id_detalle")
    private double idDetalle;

    @Column(name = "ruta_imagen")
    private String rutaImagen;

}
/*
 id_producto number(6,0),
    id_categoria number(6,0),
    descripcion varchar2(500),
    precio number(7,4),
    id_detalle number(6,0),
    ruta_imagen varchar2(1024),
*/