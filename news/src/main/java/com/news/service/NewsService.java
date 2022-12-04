package com.news.service;

import com.news.model.*;

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

    /**
     * 修改新闻
     * @param newsType
     */
    void modifyNews(NewsType newsType);

    /**
     * 根据新闻标题查找
     * @param title
     * @return
     */
    List<NewsType> getByTitle(String title);

    /**
     * 删除新闻
     * @param newsId
     */
    void deleteNews(String newsId);

    /**
     * 根据ID查询新闻
     * @param newsId
     * @return
     */
    NewsType getDetail(String newsId);

    /**
     * 获取所有分类
     * @return
     */
    List<Type> getAllType();

    /**
     * 根据分类获取新闻
     * @param typeId
     * @return
     */
    List<NewsType> getByType(Integer typeId);

    /**
     * 新增分类
     * @param typeName
     */
    void addType(String typeName);

    /**
     * 修改分类
     * @param type
     */
    void modifyType(Type type);

    /**
     * 删除分类，将该分类下的新闻更新为综合分类
     * @param typeId
     */
    void deleteType(Integer typeId);

    /**
     * 添加评论
     * @param comment
     */
    void addComment(Comment comment);

    /**
     * 根据新闻ID获取评论
     * @param newsId
     * @return
     */
    List<CommentUser> findCommentList(String newsId);

    /**
     * 删除评论
     * @param id
     */
    void deleteComm(Integer id);
}
