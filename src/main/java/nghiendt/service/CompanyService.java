package nghiendt.service;

import nghiendt.entity.Company;

import java.util.List;

public interface CompanyService {
    List<Company> findAll();

    Company findById(int companyid);

    Company create(Company company);

    Company update(Company company);

    void delete(int companyid);
}
