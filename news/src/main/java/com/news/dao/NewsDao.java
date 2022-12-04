package com.news.dao;

import com.news.model.*;

import java.util.List;

public interface NewsDao {
    void addNews(News news,int type_id);

    List<NewsType> getAll();

    void modifyNews(NewsType newsType);

    List<NewsType> getByTitle(String title);

    void deleteNews(String newsId);

    NewsType getDetail(String newsId);

    List<Type> getAllType();

    List<NewsType> getByType(Integer typeId);

    void addType(String typeName);

    void modifyType(Type type);

    void deleteType(Integer typeId);

    void addComment(Comment comment);

    List<CommentUser> findCommentList(String newsId);

    void deleteComm(Integer id);
}
