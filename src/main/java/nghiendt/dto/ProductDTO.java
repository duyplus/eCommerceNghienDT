package nghiendt.dto;

import lombok.Data;
import nghiendt.entity.Category;
import nghiendt.entity.Company;
import nghiendt.entity.OrderDetail;
import nghiendt.entity.User;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * A DTO for the {@link nghiendt.entity.Product} entity
 */
@Data
public class ProductDTO implements Serializable {
    private final Integer id;

    @Size(max = 255)
    @NotNull
    private final String name;

    @NotNull
    private final Double price;

    @NotNull
    private final Integer quantity;

    private final Integer discount;

    @NotNull
    private final Boolean available;

    @NotNull
    private final String description;

    @Size(max = 255)
    @NotNull
    private final String image;

    @NotNull
    private final Date createdAt;

    @NotNull
    private final Date updatedAt;

    @NotNull
    private final User user;

    @NotNull
    private final Category category;

    @NotNull
    private final Company company;

    private final List<OrderDetail> orderDetails;
}