package nghiendt.controller;

import nghiendt.dto.UserDTO;
import nghiendt.dto.UserRequest;
import nghiendt.payload.JwtResponse;
import nghiendt.payload.JwtTokenUtil;
import nghiendt.service.impl.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@CrossOrigin("*")
@RestController
public class HomeRestController {

    @Autowired
    private AuthenticationManager authManager;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private UserDetailsImpl userDetailsService;

//    @GetMapping("/")
//    public String sayHello() {
////        return ResponseEntity.ok("Hello! This is the project spring boot application that will be used to do restful api");
//        return "index";
//    }

    @RequestMapping({"/", "/index", "home"})
    public ModelAndView index() {
        ModelAndView view = new ModelAndView();
        view.setViewName("index");
        return view;
    }

    @PostMapping("auth/login")
    public ResponseEntity<?> login(@RequestBody UserRequest userRequest) throws Exception {
        authenticate(userRequest.getUsername(), userRequest.getPassword());
        final UserDetails userDetails = userDetailsService.loadUserByUsername(userRequest.getUsername());
        final String token = jwtTokenUtil.generateToken(userDetails);
        return ResponseEntity.ok(new JwtResponse(token));
    }

    @PostMapping("auth/register")
    public ResponseEntity<?> register(@RequestBody UserDTO user) throws Exception {
        return ResponseEntity.ok(userDetailsService.save(user));
    }

    private void authenticate(String username, String password) throws Exception {
        try {
            authManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
        } catch (DisabledException e) {
            throw new Exception("USER_DISABLED", e);
        } catch (BadCredentialsException e) {
            throw new Exception("INVALID_CREDENTIALS", e);
        }
    }
}
