package com.project.Naviera.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.project.Naviera.models.Usuario;
import com.project.Naviera.models.UsuarioDto;
import com.project.Naviera.service.UsuarioRepository;
import jakarta.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;


@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

   @Autowired
   private UsuarioRepository repo;

   @Autowired
   private PasswordEncoder passwordEncoder;

   @GetMapping({"","/"})
   public String listar(Model model){
       List<Usuario>usuarios = repo.findAll();
       model.addAttribute("usuarios", usuarios);
       return "usuarios/index";
   }  
   
   @GetMapping("/create")
   public String create(Model model){
       UsuarioDto usuarioDto = new UsuarioDto();
       model.addAttribute("usuarioDto", usuarioDto);
       return "usuarios/create";
   }

   @PostMapping("/create")
   public String CreateUsuario(
       @Valid @ModelAttribute UsuarioDto usuarioDto,
       BindingResult result){


       Usuario usuario = new Usuario();
       String encodedPassword = passwordEncoder.encode(usuarioDto.getContraseña());


       usuario.setPrimerNombre(usuarioDto.getPrimerNombre());
       usuario.setApellido(usuarioDto.getApellido());
       usuario.setUsername(usuarioDto.getUsername());
       usuario.setContraseña(encodedPassword);
       usuario.setEmail(usuarioDto.getEmail());
       usuario.setRol(usuarioDto.getRol());
       usuario.setNacionalidad(usuarioDto.getNacionalidad());
       usuario.setRutaImagen(usuarioDto.getRutaImagen());

       repo.save(usuario);

       return "redirect:/usuarios";
   }

   @GetMapping("/edit/{id}")
public String showEditForm(@PathVariable("id") int id, Model model) {
    // Obtén el usuario por ID
    Usuario usuario = repo.findById(id).orElseThrow(() -> new IllegalArgumentException("Usuario no encontrado con ID: " + id));
    
    // Convierte el usuario a UsuarioDto
    UsuarioDto usuarioDto = new UsuarioDto();
    usuarioDto.setPrimerNombre(usuario.getPrimerNombre());
    usuarioDto.setApellido(usuario.getApellido());
    usuarioDto.setUsername(usuario.getUsername());
    usuarioDto.setEmail(usuario.getEmail());
    usuarioDto.setRol(usuario.getRol());
    usuarioDto.setNacionalidad(usuario.getNacionalidad());
    usuarioDto.setRutaImagen(usuario.getRutaImagen());
    
    // Agrega UsuarioDto al modelo
    model.addAttribute("usuarioDto", usuarioDto);
    model.addAttribute("id", id); // Agrega el ID al modelo para su uso en el formulario
    
    return "usuarios/edit"; // Retorna la vista para el formulario de edición
}


   
@PostMapping("/edit/{id}")
public String updateUsuario(
        @PathVariable("id") int id,
        @Valid @ModelAttribute UsuarioDto usuarioDto,
        BindingResult result) {
    
    if (result.hasErrors()) {
        return "usuarios/edit"; // Regresa al formulario si hay errores
    }
    
    // Obtén el usuario existente por ID
    Usuario usuario = repo.findById(id).orElseThrow(() -> new IllegalArgumentException("Usuario no encontrado con ID: " + id));
    
    // Actualiza los campos del usuario
    usuario.setPrimerNombre(usuarioDto.getPrimerNombre());
    usuario.setApellido(usuarioDto.getApellido());
    usuario.setUsername(usuarioDto.getUsername());
    usuario.setEmail(usuarioDto.getEmail());
    usuario.setRol(usuarioDto.getRol());
    usuario.setNacionalidad(usuarioDto.getNacionalidad());
    usuario.setRutaImagen(usuarioDto.getRutaImagen());
    
    if (usuarioDto.getContraseña() != null && !usuarioDto.getContraseña().isEmpty()) {
        String encodedPassword = passwordEncoder.encode(usuarioDto.getContraseña());
        usuario.setContraseña(encodedPassword);
    }
    
    // Guarda el usuario actualizado
    repo.save(usuario);
    
    return "redirect:/usuarios"; // Redirige a la lista de usuarios
}


   @GetMapping("/delete")
   public String deleteUsuario(@RequestParam int id){

       try {
           Optional<Usuario> usuario = repo.findById(id);
           if (usuario.isPresent()) {
               repo.delete(usuario.get());
           }
           
       } catch (Exception e) {
           System.err.println("Exception: "+e.getMessage());
       }
       return "redirect:/usuarios";
   }
}
