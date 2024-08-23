/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.project.Naviera.dao;


import com.project.Naviera.models.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Extreme
 */
public interface CategoriaDao extends JpaRepository<Categoria, Long> {
    @Procedure(name = "categoria_insertar_SP")
    void categoria_insertar_SP(
            @Param("P_nombre_categoria") String nombreCategoria);

    @Procedure(name = "categoria_eliminar_SP")
    void categoria_eliminar_SP(
            @Param("P_id_categoria") long idCategoria);

    @Procedure(name = "categoria_actualizar_nombre_SP")
    void categoria_actualizar_nombre_SP(
            @Param("P_nombre_categoria") String nombreCategoria,
            @Param("P_id_categoria") long idCategoria);
}
