package com.project.Naviera.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.project.Naviera.models.Empleado;
import com.project.Naviera.models.Usuario;

@Repository
public class EmpleadoDao {
    

    private final JdbcTemplate jdbcTemplate;
   
    
    public EmpleadoDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void register(Empleado empleado) {
      
        jdbcTemplate.update("CALL empleado_insertar_SP(?)", empleado.getNombre());
    }

    public void Update(Empleado empleado) {
        jdbcTemplate.update("CALL empleado_actualizar_SP(?, ?)",
            empleado.getIdEmpleado(), 
            empleado.getNombre()
        );
    }

    public Empleado findById(Long id) {
    return jdbcTemplate.queryForObject(
        "SELECT * FROM FIDE_Empleado_TB WHERE ID_EMPLEADO = ?", 
        new BeanPropertyRowMapper<>(Empleado.class), 
        id
    );
    }

    public void Delete(int idUsuario) {
        try {
            jdbcTemplate.update("CALL empleado_eliminar_SP(?)", idUsuario);
            System.out.println("User with ID " + idUsuario + " deleted.");
        } catch (Exception e) {
            e.printStackTrace();  
        }
    }
}
