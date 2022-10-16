package nghiendt.dto;

import lombok.Data;
import nghiendt.entity.Order;
import nghiendt.entity.Product;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * A DTO for the {@link nghiendt.entity.OrderDetail} entity
 */
@Data
public class OrderDetailDTO implements Serializable {
    private final Integer id;
    @NotNull
    private final Double price;
    @NotNull
    private final Integer quantity;
    @NotNull
    private final Order order;
    @NotNull
    private final Product product;
}