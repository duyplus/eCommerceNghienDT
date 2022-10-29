package nghiendt.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Roles")
public class Role {
    @Id
    @Size(max = 4)
    @Column(name = "id", nullable = false, length = 4)
    private String id;

    @Size(max = 50)
    @Column(name = "name", nullable = false, length = 50)
    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "role")
    @ToString.Exclude
    List<Authority> authorities;

}