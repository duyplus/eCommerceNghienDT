package nghiendt.service;

import nghiendt.entity.Authority;

import java.util.List;

public interface AuthorityService {

    List<Authority> findAll();

    Authority findById(int authid);

    Authority create(Authority auth);

    Authority update(Authority auth);

    void delete(int authid);
}
