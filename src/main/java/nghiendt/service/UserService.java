package nghiendt.service;

import nghiendt.entity.User;

import java.util.List;

public interface UserService {

    List<User> findAll();

    User findById(int id);

    User create(User user);

    User update(User user);

    void delete(int id);

    User findUsernameByEmail(String email);

    User findByEmail(String email);

    User findByToken(String token);

}
