package nghiendt.controller;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import nghiendt.entity.Role;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@SecurityRequirement(name = "nghiendt")
@RequestMapping(value = "/api/role")
public class RoleRestController {
    @Autowired
    private RoleRepository roleRepository;

    @GetMapping
    public ResponseEntity<List<Role>> getAllRoles() {
        List<Role> listRole = roleRepository.findAll();
        if (listRole.isEmpty()) {
            return new ResponseEntity<List<Role>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Role>>(listRole, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Role> getRolesById(@PathVariable String id) {
        Role role = roleRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Role not exist with id: " + id));
        return ResponseEntity.ok(role);
    }

    @PostMapping
    public Role createRoles(@RequestBody Role role) {
        return roleRepository.save(role);
    }

    @PutMapping("{id}")
    public ResponseEntity<Role> updateRoles(@PathVariable("id") String id, @RequestBody Role role) {
        Role updateRole = roleRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Role not exist with id: " + id));
        roleRepository.save(role);
        return ResponseEntity.ok(updateRole);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> deleteRoles(@PathVariable String id) {
        Role role = roleRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Role not exist with id: " + id));
        roleRepository.delete(role);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
