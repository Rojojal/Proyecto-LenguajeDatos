package com.project.Naviera.models;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name = "FIDE_almacen_TB")
public class Almacen implements Serializable{
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id_almacen")
    private long idAlmacen;

    @Column(name = "tipo_almacen")
    private String tipoAlmacen;

    @Column(name = "Estado")
    private String estado;


    public long getIdAlmacen() {
        return idAlmacen;
    }

    public void setIdAlmacen(long idAlmacen) {
        this.idAlmacen = idAlmacen;
    }

    public String getTipoAlmacen() {
        return tipoAlmacen;
    }

    public void setTipoAlmacen(String tipoAlmacen) {
        this.tipoAlmacen = tipoAlmacen;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
/*
 id_almacen number(6,0),
    tipo_almacen varchar2(64),
 */