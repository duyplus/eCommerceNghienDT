package nghiendt.service.impl;

import nghiendt.entity.Authority;
import nghiendt.repository.AuthorityRepository;
import nghiendt.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuthorityServiceImpl implements AuthorityService {
    @Autowired
    AuthorityRepository authorityRepository;

    @Override
    public List<Authority> findAll() {
        return authorityRepository.findAll();
    }

    @Override
    public Authority findById(int id) {
        return authorityRepository.findById(id).get();
    }

    @Override
    public Authority create(Authority authority) {
        return authorityRepository.save(authority);
    }

    @Override
    public Authority update(Authority authority) {
        return authorityRepository.save(authority);
    }

    @Override
    public void delete(int id) {
        authorityRepository.deleteById(id);
    }
}
