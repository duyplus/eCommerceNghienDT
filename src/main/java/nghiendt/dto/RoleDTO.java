package nghiendt.dto;

import lombok.Data;
import nghiendt.entity.Authority;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.List;

/**
 * A DTO for the {@link nghiendt.entity.Role} entity
 */
@Data
public class RoleDTO implements Serializable {
    @Size(max = 4)
    private final String id;
    @Size(max = 50)
    @NotNull
    private final String name;
    private final List<Authority> authorities;
}