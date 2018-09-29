package cn.itsoha.controller;


import cn.itsoha.entity.User;
import cn.itsoha.service.IUserInfoService;
import cn.itsoha.utils.MD5;
import com.mysql.cj.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("user")
public class UserInfoController {
    @Resource(name = "userService")
    private IUserInfoService userInfoService;

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String save(@RequestParam(value = "user", required = true) String user, HttpServletRequest request, @RequestParam(value = "pwd", required = true) String pwd,
                       @RequestParam(value = "remember", required = true) Integer remember, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;chartSet=utf-8");
        PrintWriter writer = response.getWriter();
        if (StringUtils.isNullOrEmpty(user) || StringUtils.isNullOrEmpty(pwd)) {
            writer.print("{\"result\":\"empty\"}");
        } else {
            User db_user = userInfoService.selectByPrimaryKey("feb2d37b383443108b92a7f5a80e99fe");
            String md5Pwd = MD5.getMD5(pwd);
            Cookie userCookie = new Cookie("username", user);
            Cookie pwdCookie = new Cookie("password", pwd);
            //设置Cookie的父路径
            userCookie.setPath(request.getContextPath() + "/wxnb");
            pwdCookie.setPath(request.getContextPath() + "/wxnb");

            if (remember == 1) {

                userCookie.setMaxAge(60 * 60 * 24 * 3);
                pwdCookie.setMaxAge(60 * 60 * 24 * 3);

            } else {
                userCookie.setMaxAge(0);
                pwdCookie.setMaxAge(0);
            }

            response.addCookie(userCookie);
            response.addCookie(pwdCookie);


            //判断用户名密码是否正确
            if (db_user.getUser().equals(user) && db_user.getPwd().equals(md5Pwd)) {
                writer.print("{\"result\":\"success\"}");
                request.getSession().setAttribute("uname", "admin");
            } else {
                writer.print("{\"result\":\"error\"}");
            }
        }


        writer.flush();
        writer.close();
        return "wxnb";
    }
}
