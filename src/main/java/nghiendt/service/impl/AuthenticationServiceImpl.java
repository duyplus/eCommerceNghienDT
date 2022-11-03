package nghiendt.service.impl;

import net.bytebuddy.utility.RandomString;
import nghiendt.common.Link;
import nghiendt.dto.MailDTO;
import nghiendt.entity.User;
import nghiendt.service.AuthenticationService;
import nghiendt.service.MailerService;
import nghiendt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthenticationServiceImpl implements AuthenticationService {
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
        String link = Link.ClientLink.RESET_PASSWORD_URL;
        String url = String.format("%s?token=%s", link, token);
        String subject = "Yêu cầu đặt lại mật khẩu";
        String button = "background-color:#783ecf;color:#fff;padding:12px 10px;text-decoration:none;border-radius:3px";
        String body = "" +
                "<div style='width:50%;margin:0 auto;text-align:center'>" +
                    "<div style='padding:1em'><img src='https://i.imgur.com/t6HDHM4.png' referrerpolicy='no-referrer'></div>" +
                    "<div style='background-color:#f0f8ff;font-size:15px;padding:1em 3em'>" +
                        "<p style='font-size:18px;'><b>Ai đó đã yêu cầu đặt lại mật khẩu cho tài khoản của bạn.</b></p>" +
                        "<p>Để đặt lại mật khẩu của bạn, hãy truy cập địa chỉ bên dưới:</p>" +
                        "<p style='margin-top:2em'><a href=\""+ url + "\" style='" + button + "'>Đặt lại mật khẩu</a></p>" +
                        "<p style='margin:2em'>Email: <a href=\"" + "mailto:" + email + "\" style='color:#b745dd;text-decoration:none'>" + email + "</a></p>" +
                        "<p>Nếu đây chỉ là một sự nhầm lẫn, hãy bỏ qua email này và sẽ không có gì xảy ra.</p>" +
                    "</div>" +
                    "<div style='font-size:14px;padding:2em'>Copyright © 2022 <b>NghienDT</b>. All Rights Reserved.</div>" +
                "</div>";
        return new MailDTO(email, subject, body);
    }
}
