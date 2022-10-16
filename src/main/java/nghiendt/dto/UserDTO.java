package nghiendt.dto;

import lombok.Data;
import nghiendt.entity.Authority;
import nghiendt.entity.Order;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * A DTO for the {@link nghiendt.entity.User} entity
 */
@Data
public class UserDTO implements Serializable {
    @Size(max = 50)
    private final String id;
    @Size(max = 255)
    @NotNull
    private final String password;
    @Size(max = 15)
    @NotNull
    private final String phone;
    @Size(max = 255)
    @NotNull
    private final String fullname;
    @NotNull
    private final Date birthday;
    @Size(max = 255)
    @NotNull
    private final String email;
    @NotNull
    private final String address;
    @Size(max = 255)
    private final String image;
    @NotNull
    private final LocalDateTime createdAt;
    @NotNull
    private final LocalDateTime updatedAt;
    @Size(max = 50)
    private final String token;
    private final List<Order> orders;
    private final List<Authority> authorities;
}