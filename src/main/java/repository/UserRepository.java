package repository;

import entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    @Query("SELECT DISTINCT ar.user FROM Authority ar WHERE ar.role.id IN('DIRE','STAF')")
    List<User> getAdministrators();
}
