package nghiendt.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Reviews")
public class Review {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Nationalized
    @Lob
    @Column(name = "content")
    private String content;

    @NotNull
    @Column(name = "mark", nullable = false)
    private Integer mark;

    @Size(max = 255)
    @Nationalized
    @Column(name = "image")
    private String image;

    @Temporal(TemporalType.DATE)
    @NotNull
    @Column(name = "created_at", nullable = false)
    private Date createdAt = new Date();

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "orderdetail_id", nullable = false)
    private OrderDetail orderDetail;

}