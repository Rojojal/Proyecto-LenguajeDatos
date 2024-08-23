package com.project.Naviera.models;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;
@Data
@Entity
@Table(name = "FIDE_categoria_TB")
public class Categoria implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id_categoria")
    private Long idCategoria;

    @Column(name = "nombre_categoria")
    private String nombreCategoria;

    @Column(name = "Estado")
    private String estado;

    public Long getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(Long idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}