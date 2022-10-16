package nghiendt.dto;

import lombok.Data;
import nghiendt.entity.OrderDetail;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * A DTO for the {@link nghiendt.entity.Review} entity
 */
@Data
public class ReviewDTO implements Serializable {
    private final Integer id;
    private final String content;
    @NotNull
    private final Integer mark;
    @Size(max = 255)
    private final String image;
    @NotNull
    private final LocalDateTime createdAt;
    @NotNull
    private final OrderDetail orderDetail;
}