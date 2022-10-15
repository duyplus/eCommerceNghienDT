package service;

import entity.User;

import java.util.List;

public interface UserService {
    User findbyId(String username);

    List<User> getAdministrators();

    List<User> findAll();

    User create(User user);

    User update(User user);

    void delete(String username);

//    void loginFromOAuth2(OAuth2AuthenticationToken oauth2);
//
//    void updateToken(String token, String email) throws Exception;
//
//    User getByToken(String token);
//
//    void updatePassword(User entity, String newPassword);
//
//    void changePassword(User entity, String newPassword);
}
