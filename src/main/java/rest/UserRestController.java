package rest;

import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import repository.UserRepository;
import service.UserService;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/users")
public class UserRestController {
    @Autowired
    UserService userService;
    @Autowired
    UserRepository userRepository;

    //    @GetMapping
//    public List<User> getUsers(@RequestParam("admin") Optional<Boolean> admin) {
//        if (admin.orElse(false)) {
//            return userService.getAdministrators();
//        }
//        return userService.findAll();
//    }
    @GetMapping
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @GetMapping("{id}")
    public User getOne(@PathVariable("id") String id) {
        return userService.findbyId(id);
    }

    @PostMapping
    public User create(@RequestBody User user) {
        return userService.create(user);
    }

    @PostMapping
    public User update(@RequestBody User user) {
        return userService.update(user);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") String id) {
        userService.delete(id);
    }
}
