package ecommerce;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;

@SpringBootApplication(exclude = {
		org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class })
@Configuration
public class ECommerceLaptopApplication {

	public static void main(String[] args) {
		SpringApplication.run(ECommerceLaptopApplication.class, args);
	}

}
