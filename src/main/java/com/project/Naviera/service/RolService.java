package com.project.Naviera.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Naviera.models.Rol;

@Service
public class RolService {

    @Autowired
    private RolRepository rolRepository;

    public Rol findById(Long id) {
        return rolRepository.findById(id).orElse(null);
    }

    public void printRoles() {
        List<Rol> roles = rolRepository.findAll();
        System.out.println("Roles from service: " + roles);
    }

    public List<Rol> getAllRoles() {
        List<Rol> roles = rolRepository.findAll();
        System.out.println("Roles in service: " + roles); // Add logging
        return roles;
    }
}