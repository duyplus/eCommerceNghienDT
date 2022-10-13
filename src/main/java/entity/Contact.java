package entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "Contact")
public class Contact implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String unit;
    private String address;
    private String fax;
    private String hotline;
    private String email;
    private String facebook;
    private String instagram;
    private String zalo;

}
