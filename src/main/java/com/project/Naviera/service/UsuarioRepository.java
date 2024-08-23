package com.project.Naviera.service;



import org.springframework.data.jpa.repository.JpaRepository;


import com.project.Naviera.models.Usuario;
//a
public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{
 //cambios
   
    public Usuario findByEmail(String email);
}
