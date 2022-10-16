package nghiendt.entity;

import lombok.Data;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name = "Reviews")
public class Review implements Serializable {
    @Id
    @Column(name = "Id", nullable = false)
    private Integer id;

    @Nationalized
    @Lob
    @Column(name = "Content")
    private String content;

    @NotNull
    @Column(name = "Mark", nullable = false)
    private Integer mark;

    @Size(max = 255)
    @Nationalized
    @Column(name = "Image")
    private String image;

    @Temporal(TemporalType.DATE)
    @NotNull
    @Column(name = "CreatedAt", nullable = false)
    private Date createdAt = new Date();

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "OrderDetailId", nullable = false)
    private OrderDetail orderDetail;

}