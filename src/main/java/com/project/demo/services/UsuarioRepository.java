package com.project.demo.services;



import org.springframework.data.jpa.repository.JpaRepository;


import com.project.demo.models.usuarios.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{

   
    public Usuario findByEmail(String email);
}
