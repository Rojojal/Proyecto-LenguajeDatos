/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.Naviera.service.impl;

import com.project.Naviera.dao.CategoriaDao;
import com.project.Naviera.models.Categoria;
import com.project.Naviera.service.CategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 * @author Extreme
 */
@Service
public class CategoriaServiceImpl implements CategoriaService {

    @Autowired
    private CategoriaDao categoriaDao;



    @Override
    @Transactional(readOnly = true)
    public List<Categoria> getCategorias(boolean activo) {
        var lista = categoriaDao.findAll();
        if(activo){
            lista.removeIf(
                    c -> !c.getEstado().equals("Activo")
            );

        }

        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Categoria getCategoria(Categoria categoria) {
        return categoriaDao.getReferenceById(categoria.getIdCategoria());
    }

    @Override
    @Transactional
    public void save(Categoria categoria) {

        categoriaDao.categoria_insertar_SP(categoria.getNombreCategoria());
    }

    @Override
    @Transactional
    public void delete(Categoria categoria) {

        categoria.setEstado("inactivo");
        categoria.setNombreCategoria(categoria.getNombreCategoria());
        categoriaDao.save(categoria);
    }




}
