package com.project.Naviera.dao;

import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.project.Naviera.models.Usuario;

@Repository
public class UsuarioDao {

    private final JdbcTemplate jdbcTemplate;
    private final PasswordEncoder passwordEncoder;
    
    public UsuarioDao(JdbcTemplate jdbcTemplate, PasswordEncoder passwordEncoder) {
        this.jdbcTemplate = jdbcTemplate;
        this.passwordEncoder = passwordEncoder;
    }

    // Example method using jdbcTemplate
    public void createUsuarioAdmin(Usuario usuario) {
        String encodedPassword = passwordEncoder.encode(usuario.getContraseña());
        jdbcTemplate.update("CALL usuario_insertar_SP(?, ?, ?, ?, ?, ?, ?, ?)", usuario.getPrimerNombre(), usuario.getApellido(), usuario.getUsername(), encodedPassword, usuario.getEmail(), usuario.getRol(), usuario.getNacionalidad(), usuario.getRutaImagen());
    }

    public void register(Usuario usuario) {
        jdbcTemplate.update("CALL usuario_insertar_SP(?, ?, ?, ?, ?, ?, ?, ?)", usuario.getPrimerNombre(), usuario.getApellido(), usuario.getUsername(), usuario.getContraseña(), usuario.getEmail(), 2, usuario.getNacionalidad(), usuario.getRutaImagen());
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

    public void Delete(Usuario usuario) {
        jdbcTemplate.update("CALL usuario_eliminar_SP(?)", usuario.getIdUsuario());
    }
    
    
}
