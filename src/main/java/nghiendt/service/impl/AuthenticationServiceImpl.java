package nghiendt.service.impl;

import net.bytebuddy.utility.RandomString;
import nghiendt.common.Link;
import nghiendt.dto.MailDTO;
import nghiendt.entity.User;
import nghiendt.repository.UserRepository;
import nghiendt.service.AuthenticationService;
import nghiendt.service.MailerService;
import nghiendt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthenticationServiceImpl implements AuthenticationService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;
    @Autowired
    MailerService mailer;

    @Override
    public boolean sendResetMail(String email) {
        User user = userService.findByEmail(email);
        if (user != null) {
            String token = getToken(50);
            user.setToken(token);
            MailDTO mail = getResetMail(email, token);
            mailer.queue(mail);
            userService.update(user);
            return true;
        }
        return false;
    }

    @Override
    public User findByToken(String token) {
        User user = userService.findByToken(token);
        return user != null ? User.builder().id(user.getId()).token(user.getToken()).build() : null;
    }

    @Override
    public boolean changePassword(User user) {
        User userDb = userService.findById(user.getId());
        userDb.setPassword(user.getPassword());
        userDb.setToken(null);
        User updateUser = userService.update(userDb);
        return updateUser != null;
    }

    private String getToken(int length) {
        return RandomString.make(length);
    }

    private MailDTO getResetMail(String email, String token) {
        User user = userService.findUsernameByEmail(email);
        String username = user.getUsername();
        String link = Link.ClientLink.RESET_PASSWORD_URL;
        String url = String.format("%s?token=%s", link, token);
        String subject = "Yêu cầu đặt lại mật khẩu";
        String button = "background-color:#783ecf;color:#fff;font-size:15px;padding:12px 10px;text-decoration:none;border-radius:3px;font-weight:bold";
        String body = "" +
                "<div style='width:50%;margin:0 auto'>" +
                    "<div style='background-color:#f0f8ff;font-size:14px;padding:2em 5em'>" +
                        "<img src='https://i.imgur.com/VtXfSgp.png' referrerpolicy='no-referrer'>" +
                        "<div style='display:flex;border:1px;height:1px;background:lightblue'></div>" +
                        "<p>Hi <b>"+ username +"</b>,</p>" +
                        "<p>Chúng tôi đã nhận được yêu cầu đặt lại mật khẩu cho tài khoản NghienDT được liên kết với " + email + ". Chưa có thay đổi nào đối với tài khoản của bạn.</p>" +
                        "<p>Bạn có thể đặt lại mật khẩu của mình bằng cách nhấp vào liên kết bên dưới:</p>" +
                        "<p style='display:grid;margin:0 auto;text-align:center'><a href=\""+ url + "\" style='" + button + "'>Đặt lại mật khẩu</a></p>" +
                        "<p>Nếu bạn không yêu cầu mật khẩu mới, vui lòng cho chúng tôi biết ngay lập tức bằng cách trả lời email này.</p>" +
                        "<p>Bạn có thể tìm thấy câu trả lời cho hầu hết các câu hỏi và liên hệ với chúng tôi tại nghienecomm@gmail.com. Chúng tôi ở đây để giúp bạn.</p>" +
                        "<div style='display:flex;border:1px;height:1px;background:lightblue'></div>" +
                        "<div style='margin-top:1em'>" +
                            "<p>Toà nhà Innovation lô 24, Quang Trung, Quận 12, TP. Hồ Chí Minh</p>" +
                            "Copyright © 2022 <b>NghienDT</b>. All rights reserved." +
                        "</div>" +
                    "</div>" +
                "</div>";
        return new MailDTO(email, subject, body);
    }
}
