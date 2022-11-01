package nghiendt.controller;

import nghiendt.dto.UserRequest;
import nghiendt.payload.JwtResponse;
import nghiendt.payload.JwtTokenUtil;
import nghiendt.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@CrossOrigin("*")
@RestController
@RequestMapping(value = "/auth")
public class JwtAuthenticationController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private UserServiceImpl userServiceImpl;

    @PostMapping("login")
    public ResponseEntity<?> login(@RequestBody UserRequest authenticationRequest) throws Exception {
        checkLogin(authenticationRequest.getUsername(), authenticationRequest.getPassword());
        final UserDetails userDetails = userServiceImpl.loadUserByUsername(authenticationRequest.getUsername());
        final String token = jwtTokenUtil.generateToken(userDetails);
        return ResponseEntity.ok(new JwtResponse(token));
    }

    @PostMapping("register")
    public ResponseEntity<?> register(@RequestBody UserRequest user) throws Exception {
        return ResponseEntity.ok(userServiceImpl.save(user));
    }

    private void checkLogin(String username, String password) throws Exception {
        try {
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
        } catch (DisabledException e) {
            throw new Exception("USER_DISABLED", e);
        } catch (BadCredentialsException e) {
            throw new Exception("INVALID_CREDENTIALS", e);
        }
    }
}
