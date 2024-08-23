package com.project.Naviera.models;

import jakarta.persistence.*;
//a
@Entity
@Table(name = "FIDE_empleado_TB")
public class EmpleadoDto {
    @Id
    @Column(name = "id_empleado")
    private long idEmpleado;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "ESTADO")
    private String Estado;

    public String getEstado() {
        return this.Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public long getIdEmpleado() {
        return this.idEmpleado;
    }

    public void setIdEmpleado(long idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


}
