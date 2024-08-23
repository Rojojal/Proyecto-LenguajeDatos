package com.project.Naviera.models;

import jakarta.persistence.*;

@Entity
@Table(name = "FIDE_contenedor_TB")
public class Contenedor {
    @Id
    @Column(name = "id_contenedor")
    private Long idContenedor;

    @Column(name = "peso_neto")
    private double pesoNeto;

    @Column(name = "estado_contenedor")
    private String estadoContenedor;

    @Column(name = "peso_maximo")
    private double pesoMaximo;

    @Column(name = "valor_neto")
    private double valorNeto;
    
    @Column(name = "Estado")
    private String estado;

    @Column(name = "id_almacen")
    private double idAlmacen;

    @Column(name = "id_buque")
    private Long idBuque;

    @Column(name = "id_producto")
    private Long idProducto;

    public Long getIdContenedor() {
        return idContenedor;
    }

    public void setIdContenedor(Long idContenedor) {
        this.idContenedor = idContenedor;
    }

    public double getPesoNeto() {
        return pesoNeto;
    }

    public void setPesoNeto(double pesoNeto) {
        this.pesoNeto = pesoNeto;
    }

    public String getEstadoContenedor() {
        return estadoContenedor;
    }

    public void setEstadoContenedor(String estadoContenedor) {
        this.estadoContenedor = estadoContenedor;
    }

    public double getPesoMaximo() {
        return pesoMaximo;
    }

    public void setPesoMaximo(double pesoMaximo) {
        this.pesoMaximo = pesoMaximo;
    }

    public double getValorNeto() {
        return valorNeto;
    }

    public void setValorNeto(double valorNeto) {
        this.valorNeto = valorNeto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public double getIdAlmacen() {
        return idAlmacen;
    }

    public void setIdAlmacen(double idAlmacen) {
        this.idAlmacen = idAlmacen;
    }

//    public Almacen getAlmacen() {
//        return almacen;
//    }
//
//    public void setAlmacen(Almacen almacen) {
//        this.almacen = almacen;
//    }

    public Long getIdBuque() {
        return idBuque;
    }

    public void setIdBuque(Long idBuque) {
        this.idBuque = idBuque;
    }

    public Long getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Long idProducto) {
        this.idProducto = idProducto;
    }

//    //Join contenedor con almacen
//    @OneToOne
//    @JoinColumn(name="id_almacen")
//    private Almacen almacen;

    //join buque con contenedor
//    @ManyToOne
//    @JoinColumn(name="id_buque")
//    private Buque buque;
    
    
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