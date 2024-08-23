package com.project.Naviera.service;

import com.project.Naviera.models.Empleado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


public interface EmpleadoRepository extends JpaRepository<Empleado, Long> {
    
}
