package nghiendt.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
@Table(name = "Users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Size(max = 50)
    @Column(name = "username")
    private String username;

    @Size(max = 255)
    @Column(name = "password")
    private String password;

    @Size(max = 15)
    @Column(name = "phone")
    private String phone;

    @Size(max = 255)
    @Column(name = "fullname")
    private String fullname;

    @Temporal(TemporalType.DATE)
    @Column(name = "birthday")
    private Date birthday;

    @Size(max = 255)
    @Column(name = "email")
    private String email;

    @Column(name = "address")
    private String address;

    @Size(max = 255)
    @Column(name = "image")
    private String image;

    @Temporal(TemporalType.DATE)
    @Column(name = "created_at")
    private Date createdat;

    @Temporal(TemporalType.DATE)
    @Column(name = "updated_at")
    private Date updatedat;

    @Size(max = 50)
    @Column(name = "token")
    private String token;

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    List<Order> orders;

    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    List<Authority> authorities;

}