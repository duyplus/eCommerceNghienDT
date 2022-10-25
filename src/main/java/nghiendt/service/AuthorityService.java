package nghiendt.service;

import nghiendt.entity.Authority;

import java.util.List;

public interface AuthorityService {

    List<Authority> findAll();

    Authority findById(int id);

    Authority create(Authority auth);

    Authority update(Authority auth);

    void delete(int id);
}
