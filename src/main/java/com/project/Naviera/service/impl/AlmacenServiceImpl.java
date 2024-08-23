/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.Naviera.service.impl;

import com.project.Naviera.dao.AlmacenDao;
import com.project.Naviera.models.Almacen;
import com.project.Naviera.service.AlmacenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 * @author Extreme
 */
@Service
public class AlmacenServiceImpl implements AlmacenService {

    @Autowired
    private AlmacenDao almacenDao;



    @Override
    @Transactional(readOnly = true)
    public List<Almacen> getAlmacenes(boolean activo) {
        var lista = almacenDao.findAll();
        if(activo){
            lista.removeIf(
                    c -> !c.getEstado().equals("Activo")
            );

        }

        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Almacen getAlmacen(Almacen almacen) {
        return almacenDao.getReferenceById(almacen.getIdAlmacen());
    }

    @Override
    @Transactional
    public void save(Almacen almacen) {

        almacenDao.save(almacen);
    }

    @Override
    @Transactional
    public void insertar(Almacen almacen) {

        almacenDao.almacen_insertar_SP(almacen.getTipoAlmacen());
    }

    @Override
    @Transactional
    public void delete(Almacen almacen) {

        almacenDao.almacen_eliminar_SP(almacen.getIdAlmacen());
    }




}
