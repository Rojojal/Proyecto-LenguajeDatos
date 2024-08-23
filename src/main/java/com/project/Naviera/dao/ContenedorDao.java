/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.project.Naviera.dao;



import com.project.Naviera.models.Contenedor;
import com.project.Naviera.models.Detalle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author luis
 */
public interface ContenedorDao extends JpaRepository<Contenedor, Long> {
    @Procedure(name="contenedor_insertar_SP", procedureName = "FIDE_PROCEDIMIENTOS_FUNCIONES_PKG.contenedor_insertar_SP")
    public void contenedor_insertar_SP(
            @Param("P_peso_neto") double PPesoNeto,
            @Param("P_estado_Contenedor") String PEstadoContenedor,
            @Param("P_peso_maximo") double PPesoMaximo,
            @Param("P_valor_neto") double PValorNeto,
            @Param("P_id_buque") long PIdBuque,
            @Param("P_id_producto") long PIdProducto,
            @Param("P_id_almacen") double PIdAlmacen
            );

    @Procedure(name="contenedor_eliminar_SP", procedureName = "FIDE_PROCEDIMIENTOS_FUNCIONES_PKG.contenedor_eliminar_SP")
    public void contenedor_eliminar_SP(
            @Param("P_id_contenedor") long PIdContenedor
    );


    @Procedure(name="contenedor_actualizar_SP", procedureName = "FIDE_PROCEDIMIENTOS_FUNCIONES_PKG.contenedor_actualizar_SP")
    public void contenedor_actualizar_SP(
            @Param("P_id_contenedor") long PIdContenedor,
            @Param("P_peso_neto") double PPesoNeto,
            @Param("P_estado_Contenedor") String PEstadoContenedor,
            @Param("P_peso_maximo") double PPesoMaximo,
            @Param("P_valor_neto") double PValorNeto,
            @Param("P_id_buque") long PIdBuque,
            @Param("P_id_producto") long PIdProducto,
            @Param("P_id_almacen") double PIdAlmacen
    );
    

}