package nghiendt.service.impl;

import nghiendt.dto.UserDTO;
import nghiendt.entity.User;
import nghiendt.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UserDetailsImpl implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder pe;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with username: " + username);
        }
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), new ArrayList<>());
    }

    public User save(UserDTO userDto) {
        User user = new User();
        user.setUsername(userDto.getUsername());
        user.setPassword(pe.encode(userDto.getPassword()));
        user.setPhone(userDto.getPhone());
        user.setEmail(userDto.getEmail());
        user.setFullname(userDto.getFullname());
        user.setAddress(userDto.getAddress());
        user.setBirthday(userDto.getBirthday());
        user.setCreatedat(userDto.getCreatedAt());
        user.setUpdatedat(userDto.getUpdatedAt());
        user.setImage(userDto.getImage());
        user.setToken(userDto.getToken());
        return userRepository.save(user);
    }
}