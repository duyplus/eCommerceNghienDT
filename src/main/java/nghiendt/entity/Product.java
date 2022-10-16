package nghiendt.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.Nationalized;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "Products")
public class Product implements Serializable {
    @Id
    @Column(name = "Id", nullable = false)
    private Integer id;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "Name", nullable = false)
    private String name;

    @NotNull
    @Column(name = "Price", nullable = false)
    private Double price;

    @NotNull
    @Column(name = "Discount", nullable = false)
    private Integer discount;

    @NotNull
    @Column(name = "Available", nullable = false)
    private Boolean available = false;

    @NotNull
    @Nationalized
    @Lob
    @Column(name = "Description", nullable = false)
    private String description;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "Image", nullable = false)
    private String image;

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

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "CategoryId", nullable = false)
    private Category category;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "CompanyId", nullable = false)
    private Company company;

    @JsonIgnore
    @OneToMany(mappedBy = "product")
    List<OrderDetail> orderDetails;
}