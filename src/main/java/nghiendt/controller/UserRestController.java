package nghiendt.controller;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import nghiendt.entity.User;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.UserRepository;
import nghiendt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@SecurityRequirement(name = "nghiendt")
@RequestMapping(value = "/api/user")
public class UserRestController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> listUsers = userRepository.findAll();
        if (listUsers.isEmpty()) {
            return new ResponseEntity<List<User>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<User>>(listUsers, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<User> getUsersById(@PathVariable int id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not exist with id: " + id));
        return ResponseEntity.ok(user);
    }

    @PostMapping
    public User createUsers(@RequestBody User user) {
        return userRepository.save(user);
    }

    @PutMapping("{id}")
    public ResponseEntity<User> updateUsers(@PathVariable("id") int id, @RequestBody User user) {
        User updateUser = userRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not exist with id: " + id));
        userRepository.save(user);
        return ResponseEntity.ok(updateUser);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> deleteUsers(@PathVariable int id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User not exist with id: " + id));
        userRepository.delete(user);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
