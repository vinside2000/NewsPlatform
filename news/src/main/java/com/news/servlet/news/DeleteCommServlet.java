package com.news.servlet.news;

import com.news.service.NewsService;
import com.news.service.impl.NewsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/deleteCommServlet")
public class DeleteCommServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String newsId = request.getParameter("newsId");
        System.out.println(id);
        NewsService service = new NewsServiceImpl();
        service.deleteComm(Integer.parseInt(id));
        HttpSession session = request.getSession();
        session.setAttribute("newsId",newsId);
        request.getRequestDispatcher(request.getContextPath() + "/detailNewsServlet").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
