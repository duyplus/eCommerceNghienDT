package nghiendt.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.util.List;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "roles")
public class Role {
    @Id
    @Nationalized
    @Column(name = "id", nullable = false)
    private String id;

    @Nationalized
    @Column(name = "name")
    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "role")
    @ToString.Exclude
    List<Authority> authorities;

}