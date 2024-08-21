/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.project.Naviera.service;

import com.project.Naviera.models.Producto;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Extreme
 */
@Service
public interface ProductoService {
     public List<Producto> getProductos(boolean activos);
    
    public Producto getProducto(Producto producto);
    public Producto getProduto(Long idProducto);

    public void save(Producto producto);
    
    public void delete(Producto producto);
}
