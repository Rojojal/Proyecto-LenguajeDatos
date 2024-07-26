package com.project.Naviera.service;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.Naviera.models.Register;

public interface RegisterRepository extends JpaRepository<Register, Integer> {
    Optional<Register> findByNombreUsuario(String nombreUsuario);
}
