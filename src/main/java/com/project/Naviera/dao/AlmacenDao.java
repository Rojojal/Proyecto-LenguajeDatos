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


    @Procedure(name="FIDE_almacen_TB_eliminar_SP")
    public void FIDE_almacen_TB_eliminar_SP(
            @Param("P_id_almacen") long PIdAlmacen);
    
    

}
