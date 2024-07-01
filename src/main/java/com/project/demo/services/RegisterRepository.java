package com.project.demo.services;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.demo.models.register.Register;

public interface RegisterRepository extends JpaRepository<Register, Integer> {
    Optional<Register> findByNombreUsuario(String nombreUsuario);
}
