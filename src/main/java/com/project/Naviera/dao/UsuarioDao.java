package com.project.Naviera.dao;

import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.project.Naviera.models.Usuario;
//a
@Repository
public class UsuarioDao {

    private final JdbcTemplate jdbcTemplate;
    private final PasswordEncoder passwordEncoder;
    
    public UsuarioDao(JdbcTemplate jdbcTemplate, PasswordEncoder passwordEncoder) {
        this.jdbcTemplate = jdbcTemplate;
        this.passwordEncoder = passwordEncoder;
    }

    public void createUsuarioAdmin(Usuario usuario) {
        // Check if Rol is null
        if (usuario.getRol() == null) {
            // Log the error or handle it as needed
            throw new IllegalArgumentException("Rol cannot be null");
        }
    
        // Encode the password
        String encodedPassword = passwordEncoder.encode(usuario.getContraseña());
    
        // Retrieve the role ID
        Long rolId = usuario.getRol().getIdrol();
    
        // Perform the database operation
        jdbcTemplate.update("CALL usuario_insertar_SP(?, ?, ?, ?, ?, ?, ?, ?)",
            usuario.getPrimerNombre(),
            usuario.getApellido(),
            usuario.getUsername(),
            encodedPassword,
            usuario.getEmail(),
            rolId,
            usuario.getNacionalidad(),
            usuario.getRutaImagen());
    }
    
    

    public void register(Usuario usuario) {
        String encodedPassword = passwordEncoder.encode(usuario.getContraseña());
        jdbcTemplate.update("CALL usuario_insertar_SP(?, ?, ?, ?, ?, ?, ?, ?)", usuario.getPrimerNombre(), usuario.getApellido(), usuario.getUsername(), encodedPassword, usuario.getEmail(), 2, usuario.getNacionalidad(), usuario.getRutaImagen());
    }

    public void Update(Usuario usuario) {
        String encodedPassword = passwordEncoder.encode(usuario.getContraseña());
        jdbcTemplate.update("CALL usuario_actualizar_SP(?, ?, ?, ?, ?, ?, ?, ?, ?)",
            usuario.getIdUsuario(), 
            usuario.getPrimerNombre(),
            usuario.getApellido(),
            usuario.getUsername(),
            encodedPassword,
            usuario.getEmail(),
            usuario.getRol(),
            usuario.getNacionalidad(),
            usuario.getRutaImagen()
        );
    }

    public Usuario findById(Long id) {
    return jdbcTemplate.queryForObject(
        "SELECT * FROM FIDE_USUARIO_TB WHERE ID_USUARIO = ?", 
        new BeanPropertyRowMapper<>(Usuario.class), 
        id
    );
}

public void Delete(int idUsuario) {
    try {
        jdbcTemplate.update("CALL usuario_eliminar_SP(?)", idUsuario);
        System.out.println("User with ID " + idUsuario + " deleted.");
    } catch (Exception e) {
        e.printStackTrace();  // Log any exceptions that occur
    }
}

    
    
}
