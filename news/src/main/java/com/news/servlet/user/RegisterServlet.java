package com.news.servlet.user;


import cn.hutool.core.util.IdUtil;
import com.news.model.User;
import com.news.service.UserService;
import com.news.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("utf-8");

        //获取所有数据
        Map<String, String[]> map = request.getParameterMap();
        for (Map.Entry<String, String[]> m : map.entrySet())
        {
            System.out.println("key:" + m.getKey() + " value:" + m.getValue());
        }
        //封装对象
        User user = new User();
        System.out.println(user);
        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        user.setUserId(IdUtil.simpleUUID());
        HttpSession session = request.getSession();
        System.out.println(user);
        UserService service = new UserServiceImpl();
        //判断用户名或手机号是否已被注册
        String username = request.getParameter("username");
        if ("".equals(username)){
            request.setAttribute("register_msg","用户名不能为空！");
            request.getRequestDispatcher("/signup.jsp").forward(request,response);
            return;
        }
        if (service.findUsername(username) != null){
            request.setAttribute("register_msg","用户名已被注册！");
            request.getRequestDispatcher("/signup.jsp").forward(request,response);
            return;
        }
        String password = request.getParameter("password");//取得用户填写密码
        if ("".equals(password)){
            request.setAttribute("register_msg","密码不能为空！");
            request.getRequestDispatcher("/signup.jsp").forward(request,response);
            return;
        }
        //调用service添加到数据库
        service.addUser(user);
        Integer roleType = service.findRoleType(user.getUserId());
        session.setAttribute("user",user);
        session.setAttribute("roleType",roleType);
        response.sendRedirect(request.getContextPath() + "/webindex.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
