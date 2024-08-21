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
    @Procedure(name="categoria_insertar_SP")
    public void categoria_insertar_SP(
            @Param("P_nombre_categoria") String pNombreCategoria);
    
    

}
