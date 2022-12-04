package com.news.servlet.news;

import com.news.model.NewsType;
import com.news.model.Type;
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

@WebServlet("/newsByTypeServlet")
public class NewsByTypeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        String typeId = request.getParameter("typeId");
        System.out.println(typeId);
        NewsService service = new NewsServiceImpl();
        List<NewsType> newsTypeList = service.getByType(Integer.parseInt(typeId));

        HttpSession session = request.getSession();
        session.setAttribute("itemList",newsTypeList);
        session.setAttribute("typeId",typeId);
        response.sendRedirect(request.getContextPath() + "/webindex.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
