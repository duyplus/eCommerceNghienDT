package nghiendt.controller;

import lombok.SneakyThrows;
import nghiendt.dto.UserDTO;
import nghiendt.dto.UserRequest;
import nghiendt.entity.User;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.payload.JwtResponse;
import nghiendt.payload.JwtTokenUtil;
import nghiendt.service.AuthenticationService;
import nghiendt.service.MailerService;
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

import java.util.Optional;

@CrossOrigin("*")
@RestController
public class HomeRestController {

    @Autowired
    private AuthenticationManager authManager;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private UserDetailsImpl userDetailsService;

    @Autowired
    MailerService mailerService;
    @Autowired
    AuthenticationService authService;

    @RequestMapping({"/", "/index", "home"})
    public ModelAndView index() {
        ModelAndView view = new ModelAndView();
        view.setViewName("index");
        return view;
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

    @PostMapping("auth/forgot-password")
    public ResponseEntity<Void> sendMailToken(@RequestBody String email) {
        if (authService.sendResetMail(email)) {
            return ResponseEntity.ok().build();
        }
        throw new ResourceNotFoundException("User not exists with email: " + email);
    }

    @SneakyThrows
    @GetMapping("auth/reset-password")
    public ResponseEntity<User> checkToken(@RequestParam Optional<String> token) {
        ResourceNotFoundException exception = new ResourceNotFoundException("Cannot find token: " + token);
        String tokenVal = token.orElseThrow(() -> exception);
        User user = authService.findByToken(tokenVal);
        if (user != null) {
            return ResponseEntity.ok(user);
        }
        throw exception;
    }

    @PostMapping("auth/reset-password")
    public ResponseEntity<Void> changePassword(@RequestBody User user) {
        return authService.changePassword(user) ? ResponseEntity.ok().build() : ResponseEntity.notFound().build();
    }
}
