package nghiendt.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Settings")
public class Setting {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Size(max = 255)
    @Nationalized
    @Column(name = "unit")
    private String unit;

    @Nationalized
    @Column(name = "address")
    private String address;

    @Size(max = 20)
    @Nationalized
    @Column(name = "hotline")
    private String hotline;

    @Size(max = 55)
    @Nationalized
    @Column(name = "email")
    private String email;

    @Size(max = 255)
    @Nationalized
    @Column(name = "facebook")
    private String facebook;

    @Size(max = 255)
    @Nationalized
    @Column(name = "instagram")
    private String instagram;

    @Size(max = 255)
    @Nationalized
    @Column(name = "zalo")
    private String zalo;
}