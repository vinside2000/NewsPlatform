package com.news.servlet.news;

import com.google.gson.Gson;
import com.news.model.NewsType;
import com.news.service.NewsService;
import com.news.service.impl.NewsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/searchNewsServlet")
public class SearchNewsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String title = request.getParameter("ByName");
        NewsService service = new NewsServiceImpl();
        List<NewsType> newsTypeList = service.getByTitle(title);
        System.out.println(newsTypeList);
        Gson gson = new Gson();
        String json = gson.toJson(newsTypeList);
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
