package com.project.Naviera.models;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "FIDE_categoria_TB")
public class Categoria {
    @Id
    @Column(name = "id_categoria")
    private double idCategoria;

    @Column(name = "nombre_categoria")
    private String nombreCategoria;

    //Join tabla categoria con productos
    @OneToMany
    @JoinColumn(name="id_categoria", updatable = false)
    private List<Producto> productos;
}
/*
 id_categoria number(6,0),
    nombre_categoria varchar2(64),
 */