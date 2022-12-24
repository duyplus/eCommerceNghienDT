package nghiendt.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "reviews")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "content")
    private String content;

    @Column(name = "mark")
    private Integer mark;

    @Column(name = "image")
    private String image;

    @Temporal(TemporalType.DATE)
    @Column(name = "created_at")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date createdAt;

    @Column(name = "enable")
    private Boolean enable;

    @ManyToOne
    @JoinColumn(name = "ordetail_id")
    private OrderDetail orderDetail;

}
