package nghiendt.service;

import nghiendt.entity.User;

import java.util.List;

public interface UserService {

    List<User> findAll();

    User findById(String username);

    User create(User user);

    User update(User user);

    void delete(String username);
}
