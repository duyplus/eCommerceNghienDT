package nghiendt.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "Orders")
public class Order implements Serializable {
    @Id
    @Column(name = "Id", nullable = false)
    private Integer id;

    @NotNull
    @Column(name = "Status", nullable = false)
    private Boolean status = false;


    @Temporal(TemporalType.DATE)
    @NotNull
    @Column(name = "CreatedAt", nullable = false)
    private Date createdAt = new Date();

    @Temporal(TemporalType.DATE)
    @NotNull
    @Column(name = "UpdatedAt", nullable = false)
    private Date updatedAt;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "UserId", nullable = false)
    private User user;

    @JsonIgnore
    @OneToMany(mappedBy = "order")
    List<OrderDetail> orderDetails;

}