package nghiendt.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * A DTO for the {@link nghiendt.entity.Review} entity
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO implements Serializable {
    private Integer id;

    private String content;

    private Integer mark;

    private String image;

    private Date createdAt;

    private Double enable;
}