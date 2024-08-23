/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.project.Naviera.service;

import com.project.Naviera.models.Detalle;

import java.util.List;

/**
 *
 * @author Extreme
 */
public interface DetalleService {

    public List<Detalle> getDetalles(boolean activo);

    Detalle getDetalle(Long idDetalle);

    public Detalle getDetalle(Detalle detalle);

    public void save(Detalle detalle);

    public void delete(Detalle detalle);

    public void activar(Detalle detalle);
}
