package nghiendt.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * A DTO for the {@link nghiendt.entity.Product} entity
 */
@Data
public class ProductDTO implements Serializable {
    private final Integer id;

    private final String name;

    private final Double price;

    private final Integer quantity;

    private final Integer discount;

    private final Boolean available;

    private final String description;

    private final String image;

    private final Date createdAt;

    private final Date updatedAt;
}