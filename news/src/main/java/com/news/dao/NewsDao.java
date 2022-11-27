package com.news.dao;

import com.news.model.News;
import com.news.model.NewsType;

import java.util.List;

public interface NewsDao {
    void addNews(News news,int type_id);

    List<NewsType> getAll();
}
