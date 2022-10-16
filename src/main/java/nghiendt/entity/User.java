package nghiendt.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.Hibernate;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@Table(name = "Users")
public class User implements Serializable {
    @Id
    @Size(max = 50)
    @Column(name = "Username", nullable = false, length = 50)
    private String id;

    @Size(max = 255)
    @NotNull
    @Column(name = "Password", nullable = false)
    private String password;

    @Size(max = 15)
    @NotNull
    @Column(name = "Phone", nullable = false, length = 15)
    private String phone;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "Fullname", nullable = false)
    private String fullname;

    @Temporal(TemporalType.DATE)
    @NotNull
    @Column(name = "Birthday", nullable = false)
    private Date birthday;

    @Size(max = 255)
    @NotNull
    @Column(name = "Email", nullable = false)
    private String email;

    @NotNull
    @Nationalized
    @Lob
    @Column(name = "Address", nullable = false)
    private String address;

    @Size(max = 255)
    @Nationalized
    @Column(name = "Image")
    private String image;

    @Temporal(TemporalType.DATE)
    @NotNull
    @Column(name = "CreatedAt", nullable = false)
    private Date createdAt = new Date();

    @Temporal(TemporalType.DATE)
    @NotNull
    @Column(name = "UpdatedAt", nullable = false)
    private Date updatedAt;

    @Size(max = 50)
    @Column(name = "Token", length = 50)
    private String token;

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    @ToString.Exclude
    List<Order> orders;

    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    List<Authority> authorities;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        User user = (User) o;
        return id != null && Objects.equals(id, user.id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}