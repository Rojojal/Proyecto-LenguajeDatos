package com.project.Naviera.models;
import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
import java.util.List;
@Data
@Entity
@Table(name = "FIDE_detalle_TB")
public class Detalle implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_detalle")
    private Long idDetalle;

    @Column(name = "color")
    private String color;

    @Column(name = "tamaño")
    private String tamaño;

    @Column(name = "Estado")
    private String estado;


    //Join de la tabla detalle con productos
    @OneToOne
    @JoinColumn(name="id_detalle", updatable = false)
    private Producto producto;


    public Long getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(Long idDetalle) {
        this.idDetalle = idDetalle;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getTamaño() {
        return tamaño;
    }

    public void setTamaño(String tamaño) {
        this.tamaño = tamaño;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
}
/*
id_detalle number(6,0),
    color varchar2(30),
    tamaño varchar2(64),
 */