package com.project.Naviera.service;

import javax.mail.MessagingException;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.project.Naviera.models.Usuario;

public interface RegistroService {
//a
    public Model activar(Model model, String usuario, String clave);

    public Model crearUsuario(Model model, Usuario usuario) throws MessagingException;
    
    public void activar(Usuario usuario, MultipartFile imagenFile);
    
    public Model recordarUsuario(Model model, Usuario usuario) throws MessagingException;
}

