
package com.project.Naviera.controllers;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.Naviera.dao.UsuarioDao;
import com.project.Naviera.models.Rol;
import com.project.Naviera.models.Usuario;
import com.project.Naviera.models.UsuarioDto;
import com.project.Naviera.service.RolRepository;
import com.project.Naviera.service.RolService;
import com.project.Naviera.service.UsuarioRepository;
import com.project.Naviera.service.UsuarioService;

import jakarta.validation.Valid;

/**
 *
 * @author Josue y Luis
 */
@Controller
public class RegistroController {

    private final JdbcTemplate jdbcTemplate;

    private final UsuarioDao usuarioDao;

    public RegistroController(JdbcTemplate jdbcTemplate, UsuarioDao usuarioDao) {
        this.jdbcTemplate = jdbcTemplate;
        this.usuarioDao = usuarioDao;
    }

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

   



    @GetMapping("/register")
   public String create(Model model) {
       UsuarioDto usuarioDto = new UsuarioDto(); 
       model.addAttribute("usuarioDto", usuarioDto);
       return "register";
   }
   
   @PostMapping("/register")
   public String createUsuario(
    @ModelAttribute Usuario usuario) {
        usuarioDao.register(usuario);
       return "redirect:/";
   }
}
