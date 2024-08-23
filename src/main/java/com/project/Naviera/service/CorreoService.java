/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.Naviera.service;

import jakarta.mail.MessagingException;

/**
 *
 * @author Extreme
 */
public interface CorreoService {
    public void enviarCorreoHtml(String para, String asunto, String contenidoHtml) throws MessagingException;
}
