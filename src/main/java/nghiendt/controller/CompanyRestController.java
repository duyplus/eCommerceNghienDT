package nghiendt.controller;

import nghiendt.entity.Company;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping(value = "/api/company")
public class CompanyRestController {
    @Autowired
    private CompanyRepository companyRepository;

    @GetMapping
    public ResponseEntity<List<Company>> getAllCompanies() {
        List<Company> listCompanies = companyRepository.findAll();
        if (listCompanies.isEmpty()) {
            return new ResponseEntity<List<Company>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Company>>(listCompanies, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Company> getCompaniesById(@PathVariable int id) {
        Company company = companyRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Company not exist with id: " + id));
        return ResponseEntity.ok(company);
    }

    @PostMapping
    public Company createCompanies(@RequestBody Company company) {
        return companyRepository.save(company);
    }

    @PutMapping("{id}")
    public ResponseEntity<Company> updateCompanies(@PathVariable("id") int id, @RequestBody Company company) {
        Company updateCompany = companyRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Company not exist with id: " + id));
        companyRepository.save(company);
        return ResponseEntity.ok(updateCompany);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> deleteCompanies(@PathVariable int id) {
        Company company = companyRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Company not exist with id: " + id));
        companyRepository.delete(company);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
