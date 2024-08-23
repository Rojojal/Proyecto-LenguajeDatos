package com.project.Naviera.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.Naviera.models.Rol;
import com.project.Naviera.service.RolRepository;

import jakarta.persistence.EntityManager;

@Controller
public class testRoles {
@Autowired
private RolRepository rolRepo;

@Autowired
private EntityManager entityManager;
@GetMapping("/test-roles")
@ResponseBody
public List<Rol> manualQuery() {
    return entityManager.createQuery("SELECT r FROM Rol r", Rol.class).getResultList();
}
}
