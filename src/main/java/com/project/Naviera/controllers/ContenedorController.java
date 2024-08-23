package com.project.Naviera.controllers;
import com.project.Naviera.models.Contenedor;
import com.project.Naviera.service.ContenedorService;
import com.project.Naviera.service.ContenedorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
    @Autowired
    private ContenedorService contenedorService;


    @GetMapping("/vistaContenedor")
    public String vistaContenedor(Model model) {
        var lista = contenedorService.getContenedores(true);
        model.addAttribute("contenedores", lista);
        return "/contenedor/vistaContenedor";
    }

    @GetMapping("/agregar")
    public String agregar(Model model) {

        return "/contenedor/agregarContenedor";
    }


    @PostMapping("/guardar")
    public String guardar(Contenedor contenedor) {
        contenedorService.save(contenedor);
        return "redirect:/contenedor/vistaContenedor";
    }

    @PostMapping("/crear")
    public String insertar(Contenedor contenedor) {
        contenedorService.insertar(contenedor);
        return "redirect:/contenedor/vistaContenedor";
    }
    @GetMapping("/editar/{idContenedor}")
    public String editar(Model model, Contenedor contenedor) {
        contenedor = contenedorService.getContenedor(contenedor);
        model.addAttribute("contenedor", contenedor);
        return "/contenedor/editar";
    }


    @GetMapping("/eliminar/{idContenedor}")
    public String eliminar(Model model, Contenedor contenedor
    ) {
        contenedorService.delete(contenedor);
        return "redirect:/contenedor/vistaContenedor";
    }


}

