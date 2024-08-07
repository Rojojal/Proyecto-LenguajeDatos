package com.project.Naviera.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;
/**
 *
 * @author Josu
 */
@Controller
@Slf4j
@RequestMapping("/contenedor")
public class ContenedorController {

    @GetMapping("/vistaContenedor")
    public String vistaContenedor(Model model) {
        model.addAttribute("attribute", "value");
        return "/contenedor/vistaContenedor";
    }

    @GetMapping("/agregar")
    public String agregar(Model model) {
        model.addAttribute("attribute", "value");
        return "/contenedor/agregarContenedor";
    }

    @GetMapping("/editar")
    public String editar(Model model) {
        model.addAttribute("attribute", "value");
        return "/contenedor/editar";
    }


    @GetMapping("/eliminar")
    public String eliminar(Model model) {
        model.addAttribute("attribute", "value");
        return "redirect:/contenedor/vistaContenedor";
    }
    /*
        vista de los productos del contenedor
        Se necesita agregar la relacion del contenedor con producto contenedor
        usar aca los atributos de producto dentro de producto contenedor
     */
    @GetMapping("/verProductosContenedor")
    public String verProductos(Model model) {
        model.addAttribute("attribute", "value");
        return "/contenedor/verProductosContenedor";
    }

    @GetMapping("/verProductosContenedor/editar")
    public String editarProducto(Model model) {
        model.addAttribute("attribute", "value");
        return "/contenedor/editarProductoContenedor";
    }

    @GetMapping("/verProductosContenedor/eliminar")
    public String eliminarProducto(Model model) {
        model.addAttribute("attribute", "value");
        return "redirect:/contenedor/verProductosContenedor";
    }
    

}

