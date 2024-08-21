/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.Naviera.service.impl;

import com.project.Naviera.dao.DetalleDao;
import com.project.Naviera.models.Detalle;
import com.project.Naviera.service.DetalleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 * @author luis
 */
@Service
public class DetalleServiceImpl implements DetalleService {

    @Autowired
    private DetalleDao detalleDao;



    @Override
    @Transactional(readOnly = true)
    public List<Detalle> getDetalles(boolean activo) {
        var lista = detalleDao.findAll();
        if(activo){
            lista.removeIf(
                    c -> !c.getEstado().equals("Activo")
            );

        }

        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Detalle getDetalle(Detalle detalle) {
        return detalleDao.getReferenceById(detalle.getIdDetalle());
    }

    @Override
    @Transactional
    public void save(Detalle detalle) {

        detalleDao.detalle_insertar_SP(detalle.getColor(), detalle.getTamaño());
    }

    @Override
    @Transactional
    public void delete(Detalle detalle) {

        detalleDao.detalle_eliminar_SP(detalle.getIdDetalle());
    }




}
