package nghiendt.service;

import nghiendt.entity.User;

import java.util.List;

public interface UserService {
    User findbyId(String username);

    List<User> findAll();

    User create(User user);

    User update(User user);

    void delete(String username);
}
