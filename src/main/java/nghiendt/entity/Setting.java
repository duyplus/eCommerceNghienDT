package nghiendt.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
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
    @NotNull
    @Nationalized
    @Column(name = "unit", nullable = false)
    private String unit;

    @NotNull
    @Nationalized
    @Lob
    @Column(name = "address", nullable = false)
    private String address;

    @Size(max = 20)
    @NotNull
    @Column(name = "hotline", nullable = false, length = 20)
    private String hotline;

    @Size(max = 55)
    @NotNull
    @Column(name = "email", nullable = false, length = 55)
    private String email;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "facebook", nullable = false)
    private String facebook;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "instagram", nullable = false)
    private String instagram;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "zalo", nullable = false)
    private String zalo;
}