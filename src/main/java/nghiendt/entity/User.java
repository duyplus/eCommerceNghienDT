package nghiendt.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "Users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @NotNull
    @Size(max = 50)
    @Column(name = "username", nullable = false, length = 50)
    private String username;

    @Size(max = 255)
    @NotNull
    @Column(name = "password", nullable = false)
    private String password;

    @Size(max = 15)
    @NotNull
    @Column(name = "phone", nullable = false, length = 15)
    private String phone;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "fullname", nullable = false)
    private String fullname;

    @Temporal(TemporalType.DATE)
    @NotNull
    @Column(name = "birthday", nullable = false)
    private Date birthday;

    @Size(max = 255)
    @NotNull
    @Column(name = "email", nullable = false)
    private String email;

    @NotNull
    @Nationalized
    @Lob
    @Column(name = "address", nullable = false)
    private String address;

    @Size(max = 255)
    @Nationalized
    @Column(name = "image")
    private String image;

    @Temporal(TemporalType.DATE)
    @NotNull
    @Column(name = "created_at", nullable = false)
    private Date createdat;

    @Temporal(TemporalType.DATE)
    @NotNull
    @Column(name = "updated_at", nullable = false)
    private Date updatedat;

    @Size(max = 50)
    @Column(name = "token", length = 50)
    private String token;

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    List<Order> orders;

    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    List<Authority> authorities;

}