package com.news.service.impl;

import com.news.dao.NewsDao;
import com.news.dao.impl.NewsDaoImpl;
import com.news.model.*;
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

    @Override
    public void modifyNews(NewsType newsType) {
        dao.modifyNews(newsType);
    }

    @Override
    public List<NewsType> getByTitle(String title) {
        return dao.getByTitle(title);
    }

    @Override
    public void deleteNews(String newsId) {
        dao.deleteNews(newsId);
    }

    @Override
    public NewsType getDetail(String newsId) {
        return dao.getDetail(newsId);
    }

    @Override
    public List<Type> getAllType() {
        return dao.getAllType();
    }

    @Override
    public List<NewsType> getByType(Integer typeId) {
        return dao.getByType(typeId);
    }

    @Override
    public void addType(String typeName) {
        dao.addType(typeName);
    }

    @Override
    public void modifyType(Type type) {
        dao.modifyType(type);
    }

    @Override
    public void deleteType(Integer typeId) {
        dao.deleteType(typeId);
    }

    @Override
    public void addComment(Comment comment) {
        dao.addComment(comment);
    }

    @Override
    public List<CommentUser> findCommentList(String newsId) {
        return dao.findCommentList(newsId);
    }

    @Override
    public void deleteComm(Integer id) {
        dao.deleteComm(id);
    }
}
