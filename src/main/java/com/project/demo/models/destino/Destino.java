package com.project.demo.models.destino;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "FIDE_destino_TB")
public class Destino {
    @Column(name = "id_Destino")
    private double idDestino;

    @Column(name = "nombre_puerto")
    private double  nombrePuerto;

    @Column(name = "fecha_partida")
    private Date  fechaPartida;

    @Column(name = "fecha_llegada")
    private Date  fechaLlegada;

    @Column(name = "ubicacion")
    private String  ubicacion;

    @Column(name = "id_pais")
    private double  idPais;

    @Column(name = "id_buque")
    private double  idBuque;

}
/*
id_destino number(6,0),
    nombre_puerto varchar2(20),
    fecha_partida date,
    fecha_llegada date,
    ubicacion varchar2(40),
    id_pais number(6,0),
    id_buque number(6,0),
 */