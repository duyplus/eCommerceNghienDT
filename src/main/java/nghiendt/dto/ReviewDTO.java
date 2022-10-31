package nghiendt.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * A DTO for the {@link nghiendt.entity.Review} entity
 */
@Data
public class ReviewDTO implements Serializable {
    private final Integer id;

    private final String content;

    private final Integer mark;

    private final String image;

    private final Date createdAt;

    private final Double enable;
}