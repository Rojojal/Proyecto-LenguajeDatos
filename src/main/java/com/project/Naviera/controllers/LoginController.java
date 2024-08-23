package com.project.Naviera.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
//a
@Controller
public class LoginController {

    @GetMapping("/login")
    public String login() {
        return "login";  
    }

    @GetMapping("/logout")
    public String logout() {
        return "logout";
    }
}
