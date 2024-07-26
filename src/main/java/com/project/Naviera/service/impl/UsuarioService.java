package com.project.naviera.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.project.Naviera.models.Usuario;
import com.project.Naviera.service.UsuarioRepository;

@Service
public class UsuarioService implements UserDetailsService {

    @Autowired
    private UsuarioRepository repo;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Usuario user = repo.findByEmail(email);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with email: " + email);
        }

        // Assuming roles is not null, otherwise you should handle it.
        if (user.getRole() == null) {
            throw new UsernameNotFoundException("User role not found for user with email: " + email);
        }

        return User.withUsername(user.getEmail())
                   .password(user.getPassword())
                   .roles(user.getRole())
                   .build();
    }
}
