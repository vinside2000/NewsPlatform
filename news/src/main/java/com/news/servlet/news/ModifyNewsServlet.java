package com.news.servlet.news;

import com.news.model.NewsType;
import com.news.model.UserRole;
import com.news.service.NewsService;
import com.news.service.UserService;
import com.news.service.impl.NewsServiceImpl;
import com.news.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/modifyNewsServlet")
public class ModifyNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        Map<String, String[]> map = request.getParameterMap();
        //封装对象
        NewsType newsType = new NewsType();
        try {
            BeanUtils.populate(newsType,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println(newsType);
        NewsService service = new NewsServiceImpl();
        service.modifyNews(newsType);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
