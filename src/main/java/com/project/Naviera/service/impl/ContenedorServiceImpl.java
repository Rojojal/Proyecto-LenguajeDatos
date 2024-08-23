/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.Naviera.service.impl;

import com.project.Naviera.dao.ContenedorDao;
import com.project.Naviera.models.Contenedor;
import com.project.Naviera.service.ContenedorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 * @author luis
 */
@Service
public class ContenedorServiceImpl implements ContenedorService {

    @Autowired
    private ContenedorDao contenedorDao;



    @Override
    @Transactional(readOnly = true)
    public List<Contenedor> getContenedores(boolean activo) {
        var lista = contenedorDao.findAll();
        if(activo){
            lista.removeIf(
                    c -> !c.getEstado().equals("Activo")
            );

        }

        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Contenedor getContenedor(Contenedor contenedor) {
        return contenedorDao.getReferenceById(contenedor.getIdContenedor());
    }

    @Override
    @Transactional
    public void save(Contenedor contenedor) {

        contenedorDao.save(contenedor);
    }

    @Override
    @Transactional
    public void delete(Contenedor contenedor) {

        contenedorDao.FIDE_contenedor_TB_eliminar_SP(contenedor.getIdContenedor());
    }




}
