package nghiendt.dto;

import java.io.Serializable;

public class JwtRequest implements Serializable {
    private String username;
    private String password;
    private String phone;
    private String email;
    private String fullname;

    public JwtRequest() {
    }

    public JwtRequest(String username, String password, String phone, String email, String fullname) {
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
}