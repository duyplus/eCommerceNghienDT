package nghiendt.service;

import nghiendt.entity.User;

public interface AuthenticationService {
    boolean sendResetMail(String email);

    User findByToken(String token);

    boolean changePassword(User user);
}
