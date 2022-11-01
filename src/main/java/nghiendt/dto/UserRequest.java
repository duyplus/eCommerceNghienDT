package nghiendt.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserRequest implements Serializable {
    private String username;
    private String password;
    private String phone;
    private String email;
    private String fullname;
}