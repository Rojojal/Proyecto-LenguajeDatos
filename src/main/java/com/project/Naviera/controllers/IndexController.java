package com.project.Naviera.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Josué
 */
@Controller
public class IndexController {

    @RequestMapping("/")
    public String page(Model model) {
        model.addAttribute("attribute", "value");
        return "index";
    }
    
    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("attribute", "value");
        return "/login";
    }
    
    @RequestMapping("/register")
    public String registro(Model model) {
        model.addAttribute("attribute", "value");
        return "/register";
    }
    
    @RequestMapping("/sobreNosotros")
    public String sobreNosotros(Model model) {
        model.addAttribute("attribute", "value");
        return "/sobreNosotros/sobreNosotros";
    }
    
    @RequestMapping("/contacto")
    public String contacto(Model model) {
        model.addAttribute("attribute", "value");
        return "/contacto/contactoListado";
    }
}

