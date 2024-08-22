package com.project.Naviera.service;

import com.project.Naviera.models.Rol;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RolRepository extends JpaRepository<Rol, Long> {
     //cambios
}