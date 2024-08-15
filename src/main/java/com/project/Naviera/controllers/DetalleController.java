package com.project.Naviera.controllers;

import com.project.Naviera.models.Detalle;
import com.project.Naviera.service.DetalleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
     * @author Josu y Luis
 */
@Controller
@Slf4j
@RequestMapping("/detalle")
public class DetalleController {

    @Autowired
    private DetalleService detalleService;

    @GetMapping("/vistaDetalle")
    public String vistaDetalle(Model model) {
        var lista = detalleService.getDetalles(true);
        model.addAttribute("detalles", lista);
        return "/detalle/vistaDetalle";
    }

    @GetMapping("/mostrarTodos")
    public String mostrarTodos(Model model) {
        var lista = detalleService.getDetalles(false);
        model.addAttribute("detalles", lista);
        return "/detalle/vistaDetalle";
    }

    @GetMapping("/agregar")
    public String agregar() {

        return "/detalle/agregarDetalle";
    }


    @PostMapping("/guardar")
    public String guardar(Detalle detalle) {
        detalleService.save(detalle);
        return "redirect:/detalle/vistaDetalle";
    }

    @GetMapping("/editar/{idDetalle}")
    public String editar(Model model, Detalle detalle) {
        detalle = detalleService.getDetalle(detalle);
        model.addAttribute("detalle", detalle);
        return "/detalle/editarDetalle";
    }


    @GetMapping("/eliminar/{idDetalle}")
    public String eliminar(Detalle detalle) {

        detalleService.delete(detalle);
        return "redirect:/detalle/vistaDetalle";
    }


}

