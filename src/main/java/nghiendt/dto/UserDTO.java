package nghiendt.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * A DTO for the {@link nghiendt.entity.User} entity
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO implements Serializable {
    private String username;

    private String password;

    private String phone;

    private String fullname;

    private Date birthday;

    private String email;

    private String address;

    private String image;

    private Date createdAt;

    private Date updatedAt;

    private String token;
}