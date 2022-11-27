package com.news.servlet.news;

import cn.hutool.core.util.IdUtil;
import com.news.model.News;
import com.news.model.User;
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

@WebServlet("/addNewsServlet")
public class AddNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Map<String, String[]> map = request.getParameterMap();
        News news = new News();
        try {
            BeanUtils.populate(news,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        news.setNewsId(IdUtil.simpleUUID());
        System.out.println(news);
        String typeId = request.getParameter("typeId");
        System.out.println(typeId);
        NewsService service = new NewsServiceImpl();
        service.addNews(news,Integer.parseInt(typeId));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
