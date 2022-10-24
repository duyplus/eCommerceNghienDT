package nghiendt.service.impl;


import nghiendt.entity.Company;
import nghiendt.repository.CompanyRepository;
import nghiendt.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServicelmpl implements CompanyService {

    @Autowired
    CompanyRepository companyRepository;

    @Override
    public List<Company> findAll() {
        return companyRepository.findAll();
    }

    @Override
    public Company findById(int companyid) {
        return companyRepository.findById(companyid).get();
    }


    @Override
    public Company create(Company company) {
        return companyRepository.save(company);
    }

    @Override
    public Company update(Company company) {
        return companyRepository.save(company);
    }

    @Override
    public void delete(int companyid) {
        companyRepository.deleteById(companyid);
    }
}
