/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.project.Naviera.service;

import com.project.Naviera.models.Contenedor;

import java.util.List;

/**
 *
 * @author luis
 */

public interface ContenedorService {
     public List<Contenedor> getContenedores(boolean activo);
    
    public Contenedor getContenedor(Contenedor contenedor);

    public void save(Contenedor contenedor);
    
    public void delete(Contenedor contenedor);
}
