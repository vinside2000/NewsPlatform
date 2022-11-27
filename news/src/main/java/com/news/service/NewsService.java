package com.news.service;

import com.news.model.News;
import com.news.model.NewsType;

import java.util.List;

public interface NewsService {
    /**
     * 新增新闻
     * @param news
     * @param type_id
     */
    void addNews(News news,int type_id);

    /**
     * 获取所有新闻信息
     * @return
     */
    List<NewsType> getAll();
}
