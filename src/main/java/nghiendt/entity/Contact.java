package nghiendt.entity;

import lombok.Data;
import org.hibernate.annotations.Nationalized;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Data
@Entity
@Table(name = "Contact")
public class Contact implements Serializable {
    @Id
    @Column(name = "Id", nullable = false)
    private Integer id;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "Unit", nullable = false)
    private String unit;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "Address", nullable = false)
    private String address;

    @Size(max = 20)
    @NotNull
    @Column(name = "Fax", nullable = false, length = 20)
    private String fax;

    @Size(max = 20)
    @NotNull
    @Column(name = "Hotline", nullable = false, length = 20)
    private String hotline;

    @Size(max = 55)
    @NotNull
    @Column(name = "Email", nullable = false, length = 55)
    private String email;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "Facebook", nullable = false)
    private String facebook;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "Instagram", nullable = false)
    private String instagram;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "Zalo", nullable = false)
    private String zalo;

}