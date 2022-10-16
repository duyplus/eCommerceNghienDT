package nghiendt.rest;

import nghiendt.entity.User;
import nghiendt.repository.UserRepository;
import nghiendt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*", allowedHeaders = "*", maxAge = 3600)
@RestController
@RequestMapping(value = "/api/user")
public class UserRestController {
    @Autowired
    UserService userService;

    @GetMapping
    public List<User> getAllUsers() {
        return userService.findAll();
    }

//    @GetMapping
//    public ResponseEntity<List<User>> getAllUsers() {
//        List<User> listUser = userService.findAll();
//        if (listUser.isEmpty()) {
//            return new ResponseEntity(HttpStatus.NO_CONTENT);
//        }
//        return new ResponseEntity<List<User>>(listUser, HttpStatus.OK);
//    }

    @GetMapping("{id}")
    public User getOne(@PathVariable("id") String id) {
        return userService.findbyId(id);
    }

    @PostMapping
    public User create(@RequestBody User user) {
        return userService.create(user);
    }

    @PutMapping
    public User update(@RequestBody User user) {
        return userService.update(user);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") String id) {
        userService.delete(id);
    }
}
