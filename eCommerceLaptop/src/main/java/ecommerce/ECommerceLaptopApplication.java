package ecommerce;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"ecommerce"})
@EnableAutoConfiguration(exclude = {ErrorMvcAutoConfiguration.class})
public class ECommerceLaptopApplication {

    public static void main(String[] args) {
        SpringApplication.run(ECommerceLaptopApplication.class, args);
    }

}
