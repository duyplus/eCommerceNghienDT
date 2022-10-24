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
    public Authority findById(int authid) {
        return authorityRepository.findById(authid).get();
    }


    @Override
    public Authority create(Authority auth) {
        return authorityRepository.save(auth);
    }

    @Override
    public Authority update(Authority auth) {
        return authorityRepository.save(auth);
    }

    @Override
    public void delete(int authid) {
        authorityRepository.deleteById(authid);
    }
}
