package nghiendt.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * A DTO for the {@link nghiendt.entity.Category} entity
 */
@Data
public class CategoryDTO implements Serializable {
    private final Integer id;
    @Size(max = 100)
    @NotNull
    private final String name;
    @Size(max = 255)
    @NotNull
    private final String image;
}