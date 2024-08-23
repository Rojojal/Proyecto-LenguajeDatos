/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.project.Naviera.dao;

import com.project.Naviera.models.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Extreme
 */
public interface ProductoDao extends JpaRepository<Producto, Long> {

    
    
    @Procedure(name = "Favorite_Property.addFavoriteProperty")
    public void addFavoriteProperty(@Param("p_id_property") Long p_id_property, @Param("p_id_user") Long p_id_user);
}
