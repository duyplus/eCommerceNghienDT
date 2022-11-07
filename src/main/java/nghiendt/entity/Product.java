package nghiendt.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Products")
@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name = "getTop5Product", procedureName = "getTop5Product"),
        @NamedStoredProcedureQuery(name = "getTop5Customer", procedureName = "getTop5Customer"),
        @NamedStoredProcedureQuery(name = "getDailyRevenue", procedureName = "getDailyRevenue")
})
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Size(max = 255)
    @Nationalized
    @Column(name = "name", columnDefinition = "nvarchar")
    private String name;

    @Column(name = "price")
    private Double price;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "discount")
    private Integer discount;

    @Column(name = "available")
    private Boolean available = false;

    @Nationalized
    @Column(name = "description", columnDefinition = "nvarchar")
    private String description;

    @Size(max = 255)
    private String image;

    @Temporal(TemporalType.DATE)
    @Column(name = "created_at")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date createdAt;

    @Temporal(TemporalType.DATE)
    @Column(name = "updated_at")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date updatedAt;

    @ManyToOne
    @JsonProperty("user")
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JsonProperty("category")
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne
    @JsonProperty("company")
    @JoinColumn(name = "company_id")
    private Company company;

    @JsonIgnore
    @OneToMany(mappedBy = "product")
    List<OrderDetail> orderDetails;
}