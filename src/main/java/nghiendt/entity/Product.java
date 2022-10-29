package nghiendt.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Size(max = 255)
    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "price", nullable = false)
    private Double price;

    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    @Column(name = "discount")
    private Integer discount;

    @Column(name = "available", nullable = false)
    private Boolean available = false;

    @Column(name = "description", nullable = false)
    private String description;

    @Size(max = 255)
    @Column(name = "image", nullable = false)
    private String image;

    @Temporal(TemporalType.DATE)
    @Column(name = "created_at", nullable = false)
    private Date createdAt;

    @Column(name = "updated_at", nullable = false)
    private Date updatedAt;

    @ManyToOne
    @JsonProperty("User")
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JsonProperty("Category")
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;

    @ManyToOne
    @JsonProperty("Company")
    @JoinColumn(name = "company_id", nullable = false)
    private Company company;

    @JsonIgnore
    @OneToMany(mappedBy = "product")
    List<OrderDetail> orderDetails;
}