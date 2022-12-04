package com.news.servlet.news;

import com.news.model.CommentUser;
import com.news.model.NewsType;
import com.news.service.NewsService;
import com.news.service.impl.NewsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/detailNewsServlet")
public class DetailNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String newsId = request.getParameter("newsId");
        if ("".equals(newsId))
        {
            newsId = (String) session.getAttribute("newsId");
        }
        System.out.println("newsId == " + newsId);
        NewsService service = new NewsServiceImpl();
        NewsType newsType = service.getDetail(newsId);
        List<CommentUser> commentUserList = service.findCommentList(newsId);
        System.out.println(commentUserList);
        session.setAttribute("detail",newsType);
        session.setAttribute("commList",commentUserList);
        response.sendRedirect(request.getContextPath() + "/details.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
