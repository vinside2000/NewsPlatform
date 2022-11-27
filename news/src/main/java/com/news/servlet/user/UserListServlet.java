package com.news.servlet.user;

import com.google.gson.Gson;
import com.news.model.UserRole;
import com.news.service.UserService;
import com.news.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/userListServlet")
public class UserListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        UserService service = new UserServiceImpl();
        List<UserRole> userRoleList = service.getAll();
        for (UserRole userRole : userRoleList)
        {
            //初始化角色名
            userRole.setRoleName();
        }
        System.out.println(userRoleList);
        Gson gson = new Gson();
        String json = gson.toJson(userRoleList);
        System.out.println(json);

        // 将JSON字符串作为响应数据返回
        response.setContentType("text/json;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        writer.write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
