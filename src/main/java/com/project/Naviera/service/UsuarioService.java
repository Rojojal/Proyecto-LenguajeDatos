package com.project.Naviera.service;

import com.project.Naviera.service.UsuarioRepository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.project.Naviera.models.Rol;
import com.project.Naviera.models.Usuario;

@Service
public class UsuarioService implements UserDetailsService {

    @Autowired
    private UsuarioRepository repo;

    @Autowired
    private RolRepository Rolrepo;

    public List<Rol> getAllRoles() {
     return Rolrepo.findAll();
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Usuario usuario = usuarioRepository.findByEmail(email);
        if (usuario == null) {
            throw new UsernameNotFoundException("User not found with email: " + email);
        }
        return new org.springframework.security.core.userdetails.User(usuario.getEmail(), usuario.getContraseña(), new ArrayList<>());
    }
    @Autowired
    private UsuarioRepository usuarioRepository;
    
    public Usuario findByEmail(String email) {
        return usuarioRepository.findByEmail(email);
    }

    
   
}
