package nghiendt.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name = "Reviews")
public class Review implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String content;
    private int mark;
    private String image;

    @Temporal(TemporalType.DATE)
    @Column(name = "CreatedAt")
    private Date createdAt = new Date();

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "OrderDetailId", nullable = false)
    private OrderDetail orderDetail;
}
