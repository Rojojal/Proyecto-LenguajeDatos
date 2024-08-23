package com.project.Naviera.controllers;

import com.project.Naviera.models.Categoria;
import com.project.Naviera.service.CategoriaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Josu
 */
@Controller
@Slf4j
@RequestMapping("/categoria")
public class CategoriaController {

    @Autowired
    private CategoriaService categoriaService;

    @GetMapping("/vistaCategoria")
    public String vistaCategoria(Model model) {
        var lista = categoriaService.getCategorias(true);
        model.addAttribute("categorias", lista);
        return "/categoria/vistaCategoria";
    }

    @GetMapping("/mostrarTodos")
    public String mostrarTodos(Model model) {
        var lista = categoriaService.getCategorias(false);
        model.addAttribute("categorias", lista);
        return "/categoria/vistaCategoria";
    }

    @GetMapping("/agregar")
    public String agregar() {

        return "/categoria/agregarCategoria";
    }


    @PostMapping("/guardar")
    public String guardar(Categoria categoria) {
        categoriaService.save(categoria);
        return "redirect:/categoria/vistaCategoria";
    }

    @PostMapping("/crear")
    public String insertar(Categoria categoria) {
        categoriaService.insertar(categoria);
        return "redirect:/categoria/vistaCategoria";
    }

    @GetMapping("/editar/{idCategoria}")
    public String editar(Model model, Categoria categoria) {
        categoria = categoriaService.getCategoria(categoria);
        model.addAttribute("categoria", categoria);
        return "/categoria/editarCategoria";
    }


    @GetMapping("/eliminar/{idCategoria}")
    public String eliminar(Categoria categoria) {

        categoriaService.delete(categoria);
        return "redirect:/categoria/vistaCategoria";
    }


}

