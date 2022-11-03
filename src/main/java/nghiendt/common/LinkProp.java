package nghiendt.common;

import lombok.AccessLevel;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:client.properties")
@Getter(value = AccessLevel.PACKAGE)
class LinkProp {

    @Value("${client.link.reset-password:defaultLink}")
    String clientResetPasswordUrl;
}
