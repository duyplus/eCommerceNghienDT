package nghiendt.repository;

import nghiendt.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("SELECT u FROM User u WHERE u.email = ?1")
    User findUsernameByEmail(String email);

    User findByUsername(String username);

    User findByEmail(String email);

    User findByToken(String token);
}