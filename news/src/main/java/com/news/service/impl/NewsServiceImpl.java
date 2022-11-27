package com.news.service.impl;

import com.news.dao.NewsDao;
import com.news.dao.impl.NewsDaoImpl;
import com.news.model.News;
import com.news.model.NewsType;
import com.news.service.NewsService;

import java.util.List;

public class NewsServiceImpl implements NewsService {
    NewsDao dao = new NewsDaoImpl();
    @Override
    public void addNews(News news,int type_id) {
        dao.addNews(news,type_id);
    }

    @Override
    public List<NewsType> getAll() {
        return dao.getAll();
    }
}
