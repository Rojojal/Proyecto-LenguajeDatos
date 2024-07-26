package com.project.Naviera.service;



import org.springframework.data.jpa.repository.JpaRepository;


import com.project.Naviera.models.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{

   
    public Usuario findByEmail(String email);
}
