package nghiendt.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Users")
public class User implements Serializable {
    @Id
    private String username;
    private String password;
    private String phone;
    private String fullName;

    @Temporal(TemporalType.DATE)
    @Column(name = "Birthday")
    private Date birthDate;

    private String email;
    private String address;
    private String image;

    @Temporal(TemporalType.DATE)
    @Column(name = "CreatedAt")
    private Date createdAt = new Date();

    @Temporal(TemporalType.DATE)
    @Column(name = "UpdatedAt")
    private Date updatedAt;

    private String token;

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    List<Order> orders;

    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    List<Authority> authorities;
}
