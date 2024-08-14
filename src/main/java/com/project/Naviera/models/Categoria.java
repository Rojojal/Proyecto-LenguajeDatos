package com.project.Naviera.models;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;
import lombok.Data;
@Data
@Entity
@Table(name = "FIDE_categoria_TB")
public class Categoria implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_categoria")
    private long idCategoria;

    @Column(name = "nombre_categoria")
    private String nombreCategoria;

    @Column(name = "Estado")
    private String estado;

    //Join tabla categoria con productos
//    @OneToMany
//    @JoinColumn(name="id_categoria", updatable = false)
//    private List<Producto> productos;

    public long getIdCategoria(){
        return idCategoria;

    }

    public void setEstado(String estadoActualizado){
        estado = estadoActualizado;

    }


    public String getEstado() {
        return estado;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }
}
/*
 id_categoria number(6,0),
    nombre_categoria varchar2(64),
 */