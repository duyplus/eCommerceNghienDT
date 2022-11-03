package nghiendt;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;


@EnableWebMvc
@SpringBootApplication
@EnableScheduling
@OpenAPIDefinition(info = @Info(title = "NghienDT OpenAPI", version = "2.0", description = "A powerful yet easy-to-use suite of API developer tools."))
//@SecurityScheme(name = "nghiendt", scheme = "basic", type = SecuritySchemeType.HTTP, in = SecuritySchemeIn.HEADER)
public class ECommerceNghienDTApplication {
    public static void main(String[] args) {
        SpringApplication.run(ECommerceNghienDTApplication.class, args);
    }
}
