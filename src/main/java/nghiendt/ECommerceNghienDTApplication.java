package nghiendt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;


@EnableWebMvc
@SpringBootApplication
@EnableScheduling
//@OpenAPIDefinition(info = @Info(title = "NghienDT OpenAPI", version = "2.0", description = "A powerful yet easy-to-use suite of API developer tools."))
//@SecurityScheme(name = "nghiendt", scheme = "basic", type = SecuritySchemeType.HTTP, in = SecuritySchemeIn.HEADER)
public class ECommerceNghienDTApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ECommerceNghienDTApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(ECommerceNghienDTApplication.class, args);
    }
}
