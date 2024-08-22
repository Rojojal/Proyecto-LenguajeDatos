package com.project.Naviera.models;
import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "FIDE_destino_TB")
public class Destino {
    @Id
    @Column(name = "id_Destino")
    private long idDestino;

    @Column(name = "nombre_puerto")
    private double  nombrePuerto;

    @Column(name = "fecha_partida")
    private Date  fechaPartida;

    @Column(name = "fecha_llegada")
    private Date  fechaLlegada;

    @Column(name = "ubicacion")
    private String  ubicacion;

//    @Column(name = "id_pais")
//    private double  idPais;
//
//    @Column(name = "id_buque")
//    private double  idBuque;

    //join pais con destino
    @OneToOne
    @JoinColumn(name="id_pais")
    private Pais pais;

    //join buque con destino
    @OneToOne
    @JoinColumn(name="id_buque")
    private Buque buque;
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