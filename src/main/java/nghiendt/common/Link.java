package nghiendt.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Link {

    private static LinkProp prop;

    @Autowired
    private void setProp(LinkProp prop) {
        Link.prop = prop;
    }

    public static class ClientLink {
        public static final String RESET_PASSWORD_URL = prop.getClientResetPasswordUrl();
    }
}
