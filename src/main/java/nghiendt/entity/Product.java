package nghiendt.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "Products")
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private Double price;
    private int discount;
    private Boolean available;
    private String description;
    private String image;

    @Temporal(TemporalType.DATE)
    @Column(name = "CreatedAt")
    private Date createdAt = new Date();

    @Temporal(TemporalType.DATE)
    @Column(name = "UpdatedAt")
    private Date updatedAt;

    @ManyToOne
    @JoinColumn(name = "UserId")
    User user;

    @ManyToOne
    @JoinColumn(name = "CateId")
    Category category;

    @ManyToOne
    @JoinColumn(name = "CompanyId")
    Company company;

    @JsonIgnore
    @OneToMany(mappedBy = "product")
    List<OrderDetail> orderDetails;

}
