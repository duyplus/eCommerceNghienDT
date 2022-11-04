package nghiendt.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * A DTO for the {@link nghiendt.entity.Product} entity
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO implements Serializable {
    private Integer id;

    private String name;

    private Double price;

    private Integer quantity;

    private Integer discount;

    private Boolean available;

    private String description;

    private String image;

    private Date createdAt;

    private Date updatedAt;
}