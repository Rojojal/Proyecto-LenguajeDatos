//package com.project.naviera.controllers;
//
//import java.util.List;
//import java.util.Optional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import com.project.Naviera.models.Usuario;
//import com.project.Naviera.models.UsuarioDto;
//import com.project.Naviera.service.UsuarioRepository;
//import jakarta.validation.Valid;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//
//
//@Controller
//@RequestMapping("/usuarios")
//public class UsuarioController {
//
//    @Autowired
//    private UsuarioRepository repo;
//
//    @Autowired
//    private PasswordEncoder passwordEncoder;
//
//    @GetMapping({"","/"})
//    public String listar(Model model){
//        List<Usuario>usuarios = repo.findAll();
//        model.addAttribute("usuarios", usuarios);
//        return "usuarios/index";
//    }  
//    
//    @GetMapping("/create")
//    public String create(Model model){
//        UsuarioDto usuarioDto = new UsuarioDto();
//        model.addAttribute("usuarioDto", usuarioDto);
//        return "usuarios/create";
//    }
//
//    @PostMapping("/create")
//    public String CreateUsuario(
//        @Valid @ModelAttribute UsuarioDto usuarioDto,
//        BindingResult result){
//            
//              
//        Usuario usuario = new Usuario();
//        String encodedPassword = passwordEncoder.encode(usuarioDto.getPassword());
//
//
//        usuario.setNombre(usuarioDto.getNombre()); 
//        usuario.setEmail(usuarioDto.getEmail());
//        usuario.setNombre_usuario(usuarioDto.getNombre_usuario()); 
//        usuario.setPassword(encodedPassword); 
//        
//        repo.save(usuario);
//        
//        return "redirect:/usuarios";
//    }
//
//    @GetMapping("/edit")
//    public String showEditForm(@RequestParam("id") int id, Model model) {
//
//        try {
//            Usuario usuario = repo.findById(id).get();
//            model.addAttribute("usuario", usuario);
//
//            UsuarioDto usuarioDto = new UsuarioDto();
//            usuarioDto.setNombre(usuario.getNombre());
//            usuarioDto.setEmail(usuario.getEmail());
//            usuarioDto.setNombre_usuario(usuario.getNombre_usuario());
//            usuarioDto.setPassword(usuario.getPassword());
//
//            model.addAttribute("usuarioDto", usuarioDto);
//            
//        } catch (Exception e) {
//            System.err.println("Exception: "+e.getMessage());
//            return "redirect:/usuarios";
//        }
//
//        return "usuarios/edit";
//    }
//
//    
//    @PostMapping("/edit")
//    public String update(Model model, @RequestParam int id, @Valid @ModelAttribute UsuarioDto usuarioDto, BindingResult result){
//        
//        try {
//            Usuario usuario = repo.findById(id).get();
//            model.addAttribute("usuario", usuario);
//            if(result.hasErrors()){
//                return "redirect:/edit";
//            }
//            usuario.setNombre(usuarioDto.getNombre());
//            usuario.setNombre_usuario(usuarioDto.getNombre_usuario());
//            usuario.setEmail(usuarioDto.getEmail());
//            usuario.setPassword(usuarioDto.getPassword());
//    
//            repo.save(usuario);
//    
//        } catch (Exception e) {
//            System.err.println("Exception: "+e.getMessage());
//            
//        }
//
//        
//        return "redirect:/usuarios";
//    }
//
//
//    @GetMapping("/delete")
//    public String deleteUsuario(@RequestParam int id){
//
//        try {
//            Optional<Usuario> usuario = repo.findById(id);
//            if (usuario.isPresent()) {
//                repo.delete(usuario.get());
//            }
//            
//        } catch (Exception e) {
//            System.err.println("Exception: "+e.getMessage());
//        }
//        return "redirect:/usuarios";
//    }
//}
