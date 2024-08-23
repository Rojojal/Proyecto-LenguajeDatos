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

import com.project.Naviera.dao.UsuarioDao;
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

//a
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

   private final UsuarioDao usuarioDao;

   @Autowired
   public UsuarioController(UsuarioDao usuarioDao) {
       this.usuarioDao = usuarioDao;
   }


   @GetMapping({"","/"})
   public String listar(Model model){
       List<Usuario>usuarios = repo.findAll();
       model.addAttribute("usuarios", usuarios);
       return "usuarios/index";
   }  
   
   @GetMapping("/create")
    public String showCreateForm(Model model) {
        List<Rol> roles = rolService.getAllRoles();
        model.addAttribute("usuarioDto", new UsuarioDto());
        model.addAttribute("roles", roles);
        return "usuarios/create";
    }

    @PostMapping("/create")
public String createUsuario(@ModelAttribute UsuarioDto usuarioDto, Model model) {
  
    if (usuarioDto.getContraseña() == null || usuarioDto.getContraseña().isEmpty()) {
        model.addAttribute("error", "Password cannot be empty");
        List<Rol> roles = rolService.getAllRoles();
        model.addAttribute("roles", roles);
        return "usuarios/create";
    }

    
    Rol rol = rolRepo.findById(usuarioDto.getRolId())
                      .orElseThrow(() -> new IllegalArgumentException("Rol not found"));

    Usuario usuario = new Usuario();
    usuario.setContraseña(usuarioDto.getContraseña());
    usuario.setRol(rol);
    usuario.setPrimerNombre(usuarioDto.getPrimerNombre());
    usuario.setApellido(usuarioDto.getApellido());
    usuario.setUsername(usuarioDto.getUsername());
    usuario.setEmail(usuarioDto.getEmail());
    usuario.setNacionalidad(usuarioDto.getNacionalidad());
    usuario.setRutaImagen(usuarioDto.getRutaImagen());

    
    usuarioDao.createUsuarioAdmin(usuario);
    
    return "redirect:/"; 
}



    
   




    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Usuario usuario = usuarioDao.findById(id); 
        if (usuario != null) {
            UsuarioDto usuarioDto = convertToDto(usuario); // Convert Usuario to UsuarioDto
            
            // Fetch the list of roles from the database
            List<Rol> roles = rolService.getAllRoles(); 
            
            // Add data to the model
            model.addAttribute("usuarioDto", usuarioDto); 
            model.addAttribute("roles", roles);
            
            return "usuarios/edit"; // Return to the edit page
        } else {
            return "redirect:/usuarios"; // Redirect if user is not found
        }
    }
    
    // Method to convert Usuario to UsuarioDto
    private UsuarioDto convertToDto(Usuario usuario) {
        UsuarioDto dto = new UsuarioDto();
        dto.setIdUsuario(usuario.getIdUsuario());
        dto.setPrimerNombre(usuario.getPrimerNombre());
        dto.setApellido(usuario.getApellido());
        dto.setUsername(usuario.getUsername());
        dto.setEmail(usuario.getEmail());
        if (usuario.getRol() != null) {  // Check if Rol is not null
            dto.setRolId(usuario.getRol().getIdrol());  // Safe to call getIdrol()
        } else {
            // Handle the case where Rol is null, e.g., set a default role ID or log a warning
            dto.setRolId(null); // or a default ID like -1 or 0, depending on your use case
        }// Assuming Rol is a separate entity and is properly set in Usuario
        dto.setNacionalidad(usuario.getNacionalidad());
        dto.setRutaImagen(usuario.getRutaImagen());
        return dto;
    }
    



    


    
    @PostMapping("/edit/{id}")
    public String updateUsuario(@PathVariable("id") Long id,
                                @ModelAttribute("usuarioDto") @Valid UsuarioDto usuarioDto,
                                BindingResult result,
                                Model model) {
        if (result.hasErrors()) {
            // Reload roles in case of errors to repopulate the dropdown
            model.addAttribute("roles", rolService.getAllRoles());
            return "usuarios/edit";
        }

        // Convert UsuarioDto back to Usuario entity
        Usuario usuario = usuarioDao.findById(id);
        if (usuario != null) {
            usuario.setPrimerNombre(usuarioDto.getPrimerNombre());
            usuario.setApellido(usuarioDto.getApellido());
            usuario.setUsername(usuarioDto.getUsername());
            usuario.setEmail(usuarioDto.getEmail());
            usuario.setNacionalidad(usuarioDto.getNacionalidad());
            usuario.setRutaImagen(usuarioDto.getRutaImagen());
            Rol selectedRole = rolService.findById(usuarioDto.getRolId()); // Fetch role from the database
            usuario.setRol(selectedRole);

            // Update the user
            usuarioDao.Update(usuario);
        }

        return "redirect:/usuarios";
}


@GetMapping("/delete")
public String deleteUsuario(@RequestParam("id") int id) {
    System.out.println("Deleting user with ID: " + id);
    try {
        usuarioDao.Delete(id);
    } catch (Exception e) {
        e.printStackTrace();  // Log the exception if any
    }
    return "redirect:/usuarios";
}

}
