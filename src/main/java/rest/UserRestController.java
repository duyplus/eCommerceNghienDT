package rest;

import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import service.UserService;

@CrossOrigin("*")
@RestController
@RequestMapping(value = "/api/users")
public class UserRestController {
    @Autowired
    UserService userService;

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
