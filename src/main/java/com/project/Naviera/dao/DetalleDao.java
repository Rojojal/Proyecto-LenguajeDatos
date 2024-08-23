/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.project.Naviera.dao;

import com.project.Naviera.models.Detalle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Extreme
 */
public interface DetalleDao extends JpaRepository<Detalle, Long> {

    @Procedure(name = "detalle_insertar_SP")
    public void detalle_insertar_SP(
            @Param("P_color") String pColor,
            @Param("P_tamaño") String pTamano);

    @Procedure(name = "detalle_eliminar_SP")
    public void detalle_eliminar_SP(
            @Param("P_id_detalle") long PIdDetalle);

    @Procedure(name = "detalle_actualizar_SP")
    public void detalle_actualizar_SP(
            @Param("P_color") String pColor,
            @Param("P_tamaño") String pTamano);

    @Procedure(name = "detalle_activar_SP")
    public void detalle_activar_SP(
            @Param("P_id_detalle") long PIdDetalle);
}
