package nghiendt.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * A DTO for the {@link nghiendt.entity.Order} entity
 */
@Data
public class OrderDTO implements Serializable {
    private final Integer id;

    private final Boolean status;

    private final Date createdAt;

    private final Date updatedAt;
}