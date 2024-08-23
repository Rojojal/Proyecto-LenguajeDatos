/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.Naviera.service.impl;

import com.project.Naviera.dao.ProductoDao;
import com.project.Naviera.models.Producto;
import com.project.Naviera.service.ProductoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Extreme
 */
@Service
public class ProductoServiceImpl implements ProductoService {

    @Autowired
    private ProductoDao productoDao;
    
    @Override
    public List<Producto> getProductos(boolean activos) {
       return productoDao.findAll();
    }

    @Override
    public Producto getProducto(Producto producto) {
       return productoDao.findById(producto.getIdProducto()).orElse(null);
    }

    @Override
    public Producto getProduto(Long idProducto) {
       return productoDao.findById(idProducto).orElse(null);
    }
    @Override
    public void save(Producto producto) {
       productoDao.save(producto);
    }

    @Override
    public void delete(Producto producto) {
        productoDao.delete(producto);
    }
    
}
