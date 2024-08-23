package com.project.Naviera.models;

import jakarta.persistence.*;
import java.util.List;
import lombok.Data;


@Entity
@Table(name = "FIDE_producto_TB")
@Data
public class Producto {
    @Id
    @Column(name = "id_producto")
    private Long idProducto;

//    @Column(name = "id_categoria")
//    private double idCategoria;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "precio")
    private double precio;

//    @Column(name = "id_detalle")
//    private double idDetalle;

    @Column(name = "ruta_imagen")
    private String rutaImagen;

    //Join tabla categoria con producto
    @ManyToOne
    @JoinColumn(name="id_categoria")
    private Categoria categoria;

    //Join tabla detalle con producto
    @OneToOne
    @JoinColumn(name="id_detalle")
    private Detalle detalle;


    //Join tabla inventario con productos
    @OneToMany
    @JoinColumn(name="id_producto", updatable = false)
    private List<Inventario> inventarios;


    public Long getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Long idProducto) {
        this.idProducto = idProducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getRutaImagen() {
        return rutaImagen;
    }

    public void setRutaImagen(String rutaImagen) {
        this.rutaImagen = rutaImagen;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Detalle getDetalle() {
        return detalle;
    }

    public void setDetalle(Detalle detalle) {
        this.detalle = detalle;
    }

    public List<Inventario> getInventarios() {
        return inventarios;
    }

    public void setInventarios(List<Inventario> inventarios) {
        this.inventarios = inventarios;
    }
}
/*
 id_producto number(6,0),
    id_categoria number(6,0),
    descripcion varchar2(500),
    precio number(7,4),
    id_detalle number(6,0),
    ruta_imagen varchar2(1024),
*/