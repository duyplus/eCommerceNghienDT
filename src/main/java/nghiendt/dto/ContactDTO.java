package nghiendt.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * A DTO for the {@link nghiendt.entity.Contact} entity
 */
@Data
public class ContactDTO implements Serializable {
    private final Integer id;
    @Size(max = 255)
    @NotNull
    private final String unit;
    @Size(max = 255)
    @NotNull
    private final String address;
    @Size(max = 20)
    @NotNull
    private final String fax;
    @Size(max = 20)
    @NotNull
    private final String hotline;
    @Size(max = 55)
    @NotNull
    private final String email;
    @Size(max = 255)
    @NotNull
    private final String facebook;
    @Size(max = 255)
    @NotNull
    private final String instagram;
    @Size(max = 255)
    @NotNull
    private final String zalo;
}