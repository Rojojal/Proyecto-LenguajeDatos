package com.project.Naviera.controllers;

import com.project.Naviera.models.Almacen;
import com.project.Naviera.service.AlmacenService;
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
@RequestMapping("/almacen")
public class AlmacenController {

    @Autowired
    private AlmacenService almacenService;

    @GetMapping("/vistaAlmacen")
    public String vistaAlmacen(Model model) {
        var lista = almacenService.getAlmacenes(true);
        model.addAttribute("almacenes", lista);
        return "/almacen/vistaAlmacen";
    }

    @GetMapping("/mostrarTodos")
    public String mostrarTodos(Model model) {
        var lista = almacenService.getAlmacenes(false);
        model.addAttribute("almacenes", lista);
        return "/almacen/vistaAlmacen";
    }

    @GetMapping("/agregar")
    public String agregar() {

        return "/almacen/agregarAlmacen";
    }


    @PostMapping("/guardar")
    public String guardar(Almacen almacen) {
        almacenService.save(almacen);
        return "redirect:/almacen/vistaAlmacen";
    }

    @GetMapping("/editar/{idAlmacen}")
    public String editar(Model model, Almacen almacen) {
        almacen = almacenService.getAlmacen(almacen);
        model.addAttribute("almacen", almacen);
        return "/almacen/editarAlmacen";
    }


    @GetMapping("/eliminar/{idAlmacen}")
    public String eliminar(Almacen almacen) {

        almacenService.delete(almacen);
        return "redirect:/almacen/vistaAlmacen";
    }


}

