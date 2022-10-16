package nghiendt.dto;

import lombok.Data;
import nghiendt.entity.Role;
import nghiendt.entity.User;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * A DTO for the {@link nghiendt.entity.Authority} entity
 */
@Data
public class AuthorityDTO implements Serializable {
    private final Integer id;
    @NotNull
    private final User user;
    @NotNull
    private final Role role;
}