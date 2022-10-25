package nghiendt.dto;

import lombok.Data;
import nghiendt.entity.OrderDetail;
import nghiendt.entity.User;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * A DTO for the {@link nghiendt.entity.Order} entity
 */
@Data
public class OrderDTO implements Serializable {
    private final Integer id;

    @NotNull
    private final Boolean status;

    @NotNull
    private final LocalDateTime createdAt;

    @NotNull
    private final LocalDateTime updatedAt;

    @NotNull
    private final User user;
    
    private final List<OrderDetail> orderDetails;
}