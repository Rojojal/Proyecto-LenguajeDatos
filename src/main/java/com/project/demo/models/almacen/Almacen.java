package com.project.demo.models.almacen;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "FIDE_almacen_TB")
public class Almacen {
    @Column(name = "id_almacen")
    private double idAlmacen;

    @Column(name = "tipo_almacen")
    private String tipoAlmacen;
}
/*
 id_almacen number(6,0),
    tipo_almacen varchar2(64),
 */