package com.moviland.eureka_server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
// 👇 Esta anotación convierte a esta app en un servidor Eureka
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * Servidor de descubrimiento Eureka.
 * UI disponible en http://localhost:8761 cuando la app esté corriendo.
 */
@SpringBootApplication
@EnableEurekaServer // <- ¡Activamos Eureka Server!
public class EurekaServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(EurekaServerApplication.class, args);
	}
}
