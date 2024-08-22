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

import com.project.Naviera.models.Rol;
import com.project.Naviera.models.Usuario;
import com.project.Naviera.models.UsuarioDto;
import com.project.Naviera.service.RolRepository;
import com.project.Naviera.service.RolService;
import com.project.Naviera.service.UsuarioRepository;
import com.project.Naviera.service.UsuarioService;

import jakarta.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;


@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioService userService;

   @Autowired
   private UsuarioRepository repo;
   
   @Autowired
   private RolRepository rolRepo;

   @Autowired
   private RolService rolService;


   @Autowired
   private PasswordEncoder passwordEncoder;

   @GetMapping({"","/"})
   public String listar(Model model){
       List<Usuario>usuarios = repo.findAll();
       model.addAttribute("usuarios", usuarios);
       return "usuarios/index";
   }  
   
   @GetMapping("/create")
   public String create(Model model) {
       UsuarioDto usuarioDto = new UsuarioDto();
       
       List<Rol> roles = rolService.getAllRoles();
       System.out.println("Roles: " + roles);
       model.addAttribute("usuarioDto", usuarioDto);
       model.addAttribute("roles", roles);
       return "usuarios/create";
   }
   
   @PostMapping("/create")
   public String createUsuario(
           @Valid @ModelAttribute UsuarioDto usuarioDto,
           BindingResult result,
           Model model) {
       if (result.hasErrors()) {
           List<Rol> roles = rolService.getAllRoles();
           model.addAttribute("roles", roles);
           return "usuarios/create";
       }
   
       Usuario usuario = new Usuario();
       String encodedPassword = passwordEncoder.encode(usuarioDto.getContraseña());
   
       usuario.setPrimerNombre(usuarioDto.getPrimerNombre());
       usuario.setApellido(usuarioDto.getApellido());
       usuario.setUsername(usuarioDto.getUsername());
       usuario.setContraseña(encodedPassword);
       usuario.setEmail(usuarioDto.getEmail());
       Integer rolId = usuarioDto.getRolId();
        Long rolIdLong = rolId.longValue(); // Convert Integer to Long
        Rol rol = rolService.getAllRoles().stream()
                .filter(r -> r.getIdrol().equals(rolIdLong))
                .findFirst()
                .orElse(null);

       if (rol != null) {
           usuario.setRol(rol);
       } else {
           result.rejectValue("rolId", "error.rolId", "Invalid Role ID");
           List<Rol> roles = rolService.getAllRoles();
           model.addAttribute("roles", roles);
           return "usuarios/create";
       }
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
    if (usuario.getRol() != null) {
        usuarioDto.setRolId(usuario.getRol().getIdrol().intValue()); // Ensure this is Long
    }
    
    
    usuarioDto.setNacionalidad(usuario.getNacionalidad());
    usuarioDto.setRutaImagen(usuario.getRutaImagen());
    
    // Agrega UsuarioDto al modelo
    model.addAttribute("usuarioDto", usuarioDto);
    model.addAttribute("roles", rolRepo.findAll());
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
    Rol rol = rolRepo.findById(usuarioDto.getRolId().longValue()).orElse(null);
        if (rol != null) {
            usuario.setRol(rol);
        } else {
            // Handle the case where Rol was not found (e.g., show an error message)
            result.rejectValue("rolId", "error.rolId", "Invalid Role ID");
            return "usuarios/edit";
        }
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
