/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.Naviera.controllers;

import com.project.Naviera.service.CorreoService;
import jakarta.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Josue y Luis
 */
@Controller
@RequestMapping("/enviarCorreo")
public class EnviarCorreoController {

    @Autowired
    private CorreoService correoService;

    @GetMapping
    public String mostrarFormulario() {
        return "/Contacto/salidaMensaje";

    }

    @PostMapping("/enviar")
    public String enviarCorreo(Model model, @RequestParam("correo") String correo) {
        try {

            String asunto = "¡Gracias por contactarnos!";
           String contenidoHtml = "<p style=\"color:black;\">¡Es un placer saludarlo y agradecerle por haberse puesto en contacto con nosotros! Valoramos enormemente su interés en nuestra organización y en la posibilidad de adoptar una mascota.</p>"
                    + "<p style=\"color:black;\">Estamos aquí para ayudarlo en cada paso del proceso de adopción y para proporcionarle toda la información y el apoyo que pueda necesitar. Si hay alguna pregunta adicional que tenga o si necesita más detalles sobre nuestros procedimientos de adopción, no dude en hacérnoslo saber. Estamos aquí para asegurarnos de que su experiencia de adopción sea lo más fácil y gratificante posible.</p>"
                    + "<p style=\"color:black;\">Además, si desea programar una visita a nuestro refugio para conocer a los adorables animales que tenemos disponibles para adopción o para discutir sus necesidades específicas con nuestro equipo de adopciones, estaremos encantados de organizarlo según su conveniencia.</p>"
                    + "<p style=\"color:black;\">Por favor, siéntase libre de responder a este correo electrónico o de comunicarse con nosotros por teléfono al +506 2222 2222 en cualquier momento. Estamos emocionados de poder ayudarlo en su búsqueda de encontrar a su nuevo amigo peludo.</p>"
                    + "<p style=\"color:black;\">¡Gracias nuevamente por considerar la adopción y por elegir a Patitas Felices como su destino para encontrar a su compañero de vida!</p>"
                    + "<p style=\"color:black;\">¡Esperamos tener noticias suyas pronto!</p>"
                    + "<p style=\"color:black;\">Atentamente,</p>"
                    + "<p style=\"color:black;\">Patitas Felices</p>"
                    + "<p style=\"color:black;\">Soporte de Naviera InterMesk</p>"
                    + "<p style=\"color:black;\">+506 2222 2222</p>"
                    + "<p style=\"color:black;\">patitasfelices@gmail.com</p>";



            correoService.enviarCorreoHtml(correo, asunto, contenidoHtml);

            model.addAttribute("mensaje", "Correo enviado exitosamente a " + correo);
        } catch (MessagingException e) {
            model.addAttribute("error", "Error al enviar el correo electrónico.");
        }

        return "/Contacto/salidaMensaje";
    }
}
