/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.project.Naviera.service;

import com.project.Naviera.models.Almacen;

import java.util.List;

/**
 *
 * @author luis
 */

public interface AlmacenService {
     public List<Almacen> getAlmacenes(boolean activo);
    
    public Almacen getAlmacen(Almacen almacen);

    public void save(Almacen almacen);

    public void insertar(Almacen almacen);
    
    public void delete(Almacen almacen);
}
