package com.project.demo.models.categoria;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "FIDE_categoria_TB")
public class Categoria {
    @Column(name = "id_categoria")
    private double idCategoria;

    @Column(name = "nombre_categoria")
    private String nombreCategoria;
}
/*
 id_categoria number(6,0),
    nombre_categoria varchar2(64),
 */