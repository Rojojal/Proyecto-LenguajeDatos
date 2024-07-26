package com.project.Naviera.service;
import org.springframework.web.multipart.MultipartFile;
public interface firebaseService {
    public String cargaImagen(MultipartFile archivoLocalCliente, String carpeta, Long id);


    final String BucketName = "transportes-sa.appspot.com";

    //carpeta donde se guardaran las imagenes
    final String rutaSuperiorStorage = "transportes-sa";

    //ubicacion de la clave de la api
    final String rutaJsonFile = "firebase";

    //clave de la api
    final String archivoJsonFile = "transportes-sa-firebase-adminsdk-lrs0n-53521281f6.json";
}
