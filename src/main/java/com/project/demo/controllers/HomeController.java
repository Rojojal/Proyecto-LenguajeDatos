package com.project.demo.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.demo.models.register.Register;
import com.project.demo.models.register.RegisterDto;
import com.project.demo.services.RegisterRepository;

import jakarta.validation.Valid;

@Controller
public class HomeController {

    @Autowired
    private RegisterRepository repo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/")
    public String goHome() {
        return "index";
    }

    @GetMapping("/sigin")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String register(Model model) {
        RegisterDto registerDto = new RegisterDto();
        model.addAttribute("registerDto", registerDto);
        model.addAttribute("success", false);
        return "register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("registerDto") RegisterDto registerDto,
                           BindingResult result, Model model) {

        if (!registerDto.getPassword().equals(registerDto.getConfirmPassword())) {
            model.addAttribute("error", "Password and Confirm Password do not match");
            return "register";
        }

        if (result.hasErrors()) {
            return "register";
        }

        Optional<Register> existingUser = repo.findByNombreUsuario(registerDto.getNombreUsuario());
        if (existingUser.isPresent()) {
            model.addAttribute("msg", "Username already exists");
            return "register";
        }

        Register register = new Register();
        String encodedPassword = passwordEncoder.encode(registerDto.getPassword());

        register.setNombre(registerDto.getNombre());
        register.setEmail(registerDto.getEmail());
        register.setnombreUsuario(registerDto.getNombreUsuario());
        register.setRole("client");
        register.setPassword(encodedPassword);

        Register savedUsuario = repo.save(register);

        if (savedUsuario != null) {
            model.addAttribute("success", true);
        } else {
            model.addAttribute("error", "Something went wrong on the server");
        }

        return "register";
    }
}
