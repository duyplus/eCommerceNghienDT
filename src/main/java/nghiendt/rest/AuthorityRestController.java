package nghiendt.rest;

import nghiendt.entity.Authority;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.AuthorityRepository;
import nghiendt.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin("*")
@RestController
@RequestMapping(value = "/api/author")
public class AuthorityRestController {
    @Autowired
    private AuthorityService authorityService;

    @Autowired
    private AuthorityRepository authorityRepository;

    @GetMapping
    public ResponseEntity<List<Authority>> getAllCompanies() {
        List<Authority> listAuthority = authorityRepository.findAll();
        if (listAuthority.isEmpty()) {
            return new ResponseEntity<List<Authority>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Authority>>(listAuthority, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Authority> getCompaniesById(@PathVariable int id) {
        Authority authority = authorityRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Company not exist with id: " + id));
        return ResponseEntity.ok(authority);
    }

    @PostMapping
    public Authority create(@RequestBody Authority authority) {
        return authorityRepository.save(authority);
    }

    @PutMapping("{id}")
    public ResponseEntity<Authority> update(@PathVariable("id") int id, @RequestBody Authority authority) {
        Authority updateAuthority = authorityRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Company not exist with id: " + id));
        authorityRepository.save(authority);
        return ResponseEntity.ok(updateAuthority);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> delete(@PathVariable int id) {
        Authority authority = authorityRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Company not exist with id: " + id));
        authorityRepository.delete(authority);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
