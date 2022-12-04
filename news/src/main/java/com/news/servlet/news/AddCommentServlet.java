package com.news.servlet.news;

import cn.hutool.core.util.IdUtil;
import com.news.model.Comment;
import com.news.model.News;
import com.news.service.NewsService;
import com.news.service.impl.NewsServiceImpl;
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

@WebServlet("/addCommentServlet")
public class AddCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Map<String, String[]> map = request.getParameterMap();
        Comment comment = new Comment();
        try {
            BeanUtils.populate(comment,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println(comment);
        NewsService service = new NewsServiceImpl();
        service.addComment(comment);
        HttpSession session = request.getSession();
        session.setAttribute("newsId",comment.getNewsId());
        request.getRequestDispatcher(request.getContextPath() + "/detailNewsServlet").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
