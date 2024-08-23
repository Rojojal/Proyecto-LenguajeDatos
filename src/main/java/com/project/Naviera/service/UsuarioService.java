package com.project.Naviera.service;

import static com.google.cloud.Identity.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.Naviera.models.Rol;
import com.project.Naviera.models.Usuario;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
//a

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
        var roles = new ArrayList<GrantedAuthority>();
         roles.add(new SimpleGrantedAuthority(usuario.getIdrol().getNombreRol()));
   

        return new org.springframework.security.core.userdetails.User(usuario.getEmail(), usuario.getContraseña(),roles);
    }
    @Autowired
    private UsuarioRepository usuarioRepository;

    public Usuario findByEmail(String email) {
        return usuarioRepository.findByEmail(email);
    }

}
