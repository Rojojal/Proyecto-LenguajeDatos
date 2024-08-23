package com.project.Naviera.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Josu
 */
@Controller
@Slf4j
@RequestMapping("/productoContenedor")
public class ProductoContenedorController {

    /*
        Se necesita agregar la relacion del contenedor con producto contenedor
        usar aca los atributos de producto dentro de producto contenedor
     */
    @GetMapping("/ver")
    public String verProductosContenedor(Model model) {
        model.addAttribute("attribute", "value");
        return "/productoContenedor/verProductosContenedor";
    }

    @GetMapping("/editar")
    public String editarProductoContenedor(Model model) {
        model.addAttribute("attribute", "value");
        return "/productoContenedor/editarProductoContenedor";
    }

    @GetMapping("/eliminar")
    public String eliminarProductoContenedor(Model model) {
        model.addAttribute("attribute", "value");
        return "redirect:/productoContenedor/verProductosContenedor";
    }


    @GetMapping("/agregar")
    public String agregarProductoContenedor(Model model) {
        model.addAttribute("attribute", "value");
        return "/productoContenedor/agregarProductoContenedor";
    }

}

