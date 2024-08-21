/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.project.Naviera.service;

import com.project.Naviera.models.Categoria;



import java.util.List;

/**
 *
 * @author Extreme
 */

public interface CategoriaService {
     public List<Categoria> getCategorias(boolean activo);
    
    public Categoria getCategoria(Categoria categoria);

    public void save(Categoria categoria);
    
    public void delete(Categoria categoria);
}
