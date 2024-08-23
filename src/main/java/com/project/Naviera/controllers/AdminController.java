/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.Naviera.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Extreme
 */
@Controller
public class AdminController {

    @RequestMapping("/AccesoAdmin")
    public String page(Model model) {
        model.addAttribute("attribute", "value");
        return "Administracion/AccesoAdmin";
    }
    
 
}

