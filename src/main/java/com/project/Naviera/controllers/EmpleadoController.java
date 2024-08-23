package com.project.Naviera.controllers;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.Naviera.models.Empleado;
import com.project.Naviera.models.EmpleadoDto;
import com.project.Naviera.service.EmpleadoRepository;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/empleados")
public class EmpleadoController {

    @Autowired
    private EmpleadoRepository repo;

    @GetMapping({"", "/"})
    public String listar(Model model) {
        List<Empleado> empleados = repo.findAll();
        model.addAttribute("empleados", empleados);
        return "empleados/index";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) { 
        model.addAttribute("empleadoDto", new EmpleadoDto());
        return "empleados/create";
    }

    @PostMapping("/create")
    public String createEmpleado(@ModelAttribute @Valid EmpleadoDto empleadoDto, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "empleados/create";
        }
        Empleado empleado = new Empleado();
        empleado.setNombre(empleadoDto.getNombre());
        repo.save(empleado);
        return "redirect:/empleados"; 
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Empleado empleado = repo.findById(id).orElse(null); 
        if (empleado != null) {
            EmpleadoDto empleadoDto = convertToDto(empleado);
            model.addAttribute("empleadoDto", empleadoDto); 
            return "empleados/edit"; 
        } else {
            return "redirect:/empleados"; 
        }
    }

    @PostMapping("/edit/{id}")
    public String updateEmpleado(@PathVariable("id") Long id,
                                 @ModelAttribute("empleadoDto") @Valid EmpleadoDto empleadoDto,
                                 BindingResult result,
                                 Model model) {
        if (result.hasErrors()) {
            return "empleados/edit"; 
        }
        Empleado empleado = repo.findById(id).orElse(null);
        if (empleado != null) {
            empleado.setNombre(empleadoDto.getNombre());
            repo.save(empleado);
        }
        return "redirect:/empleados";
    }

    private EmpleadoDto convertToDto(Empleado empleado) {
        EmpleadoDto dto = new EmpleadoDto();
        dto.setIdEmpleado(empleado.getIdEmpleado());
        dto.setNombre(empleado.getNombre());
        return dto;
    }

    @GetMapping("/delete")
    public String deleteEmpleado(@RequestParam("id") Long id) {
        repo.deleteById(id);
        return "redirect:/empleados";
    }
}