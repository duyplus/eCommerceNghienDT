package nghiendt.service;

import nghiendt.entity.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.List;

public interface UserService {

    List<User> findAll();

    User findById(int id);

    User create(User user);

    User update(User user);

    void delete(int id);

    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException;
}
