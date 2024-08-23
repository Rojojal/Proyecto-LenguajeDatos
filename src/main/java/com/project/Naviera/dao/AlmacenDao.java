/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.project.Naviera.dao;



import com.project.Naviera.models.Almacen;
import com.project.Naviera.models.Detalle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Extreme
 */
public interface AlmacenDao extends JpaRepository<Almacen, Long> {


    @Procedure(name="almacen_insertar_SP", procedureName = "FIDE_PROCEDIMIENTOS_FUNCIONES_PKG.almacen_insertar_SP")
    public void almacen_insertar_SP(
            @Param("P_tipo_almacen") String tipoAlmacen);

    @Procedure(name="almacen_eliminar_SP", procedureName = "FIDE_PROCEDIMIENTOS_FUNCIONES_PKG.almacen_eliminar_SP")
    public void almacen_eliminar_SP(
            @Param("P_id_almacen") long PIdAlmacen);

    @Procedure(name="almacen_actualizar_SP", procedureName = "FIDE_PROCEDIMIENTOS_FUNCIONES_PKG.almacen_actualizar_SP")
    public void almacen_actualizar_SP(
            @Param("P_id_almacen") long PIdAlmacen,
            @Param("P_tipo_almacen") String tipoAlmacen);
    
    

}
