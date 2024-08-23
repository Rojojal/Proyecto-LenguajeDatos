package com.project.Naviera.models;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "FIDE_contenedor_producto_TB")
public class ProductoContenedor {
    @Id
    @Column(name = "id_contenedor_producto")
    private long idContenedorProducto;

//    @Column(name = "id_producto")
//    private double idProducto;
//
//    @Column(name = "id_contenedor")
//    private double idContenedor;

    //join contenedor_producto con producto
    @ManyToOne
    @JoinColumn(name="id_producto")
    private Producto producto;
    //join contenedor_producto con contenedor
    @ManyToOne
    @JoinColumn(name="id_contenedor")
    private Contenedor contenedor;
}
/*
 id_contenedor_producto number(6,0),
    id_producto number(6,0),
    id_contenedor number(6,0),
    CONSTRAINT FIDE_contenedor_producto_TB_id_contenedor_producto_pk PRIMARY KEY (id_contenedor_producto),
    CONSTRAINT FIDE_contenedor_producto_TB_id_producto_fk FOREIGN KEY (id_producto) REFERENCES G8admin.FIDE_producto_TB(id_producto),
    CONSTRAINT FIDE_contenedor_producto_TB_id_contenedor_fk FOREIGN KEY (id_contenedor) REFERENCES G8admin.FIDE_contenedor_TB(id_contenedor)
 */