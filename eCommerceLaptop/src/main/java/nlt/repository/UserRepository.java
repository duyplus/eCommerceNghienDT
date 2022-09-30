package nlt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import nlt.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

}
