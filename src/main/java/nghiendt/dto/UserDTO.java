package nghiendt.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * A DTO for the {@link nghiendt.entity.User} entity
 */
@Data
public class UserDTO implements Serializable {
    private final String username;

    private final String password;

    private final String phone;

    private final String fullname;

    private final Date birthday;

    private final String email;

    private final String address;

    private final String image;

    private final Date createdAt;

    private final Date updatedAt;

    private final String token;
}