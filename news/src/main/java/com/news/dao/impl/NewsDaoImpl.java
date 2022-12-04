package com.news.dao.impl;

import com.news.dao.NewsDao;
import com.news.model.*;
import com.news.util.JDBCUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class NewsDaoImpl implements NewsDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public void addNews(News news,int type_id) {
        String sql1 = "insert into nnewstype(id,type_id,news_id) values(?,?,?)";
        template.update(sql1,null,type_id,news.getNewsId());
        String sql2 = "insert into nnews(news_id,author,title,content) values(?,?,?,?)";
        template.update(sql2,news.getNewsId(),news.getAuthor(),news.getTitle(),news.getContent());
    }

    @Override
    public List<NewsType> getAll() {
        try{
            String sql = "select a.news_id, a.author, a.title, a.content, b.type_id, b.type_name from nnews a,ntype b, nnewstype c where c.news_id = a.news_id and c.type_id = b.type_id";
            return template.query(sql,new BeanPropertyRowMapper<NewsType>(NewsType.class));
        }
        catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public void modifyNews(NewsType newsType) {
        String sql1 = "update nnewstype set type_id = ? where news_id = ?";
        template.update(sql1,newsType.getTypeId(),newsType.getNewsId());
        String sql2 = "update nnews set author = ?, title = ?,content = ? where news_id = ?";
        template.update(sql2,newsType.getAuthor(),newsType.getTitle(),newsType.getContent(),newsType.getNewsId());
    }

    @Override
    public List<NewsType> getByTitle(String title) {
        try{
            String sql = "select a.news_id, a.author, a.title, a.content, b.type_id, b.type_name from nnews a,ntype b, nnewstype c where c.news_id = a.news_id and c.type_id = b.type_id and a.title like \"%\"?\"%\" ";
            return template.query(sql,new BeanPropertyRowMapper<NewsType>(NewsType.class),title);
        }
        catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public void deleteNews(String newsId) {
        String sql1 = "delete from nnewstype where news_id = ?";
        template.update(sql1,newsId);
        String sql2 = "delete from ncomment where news_id = ?";
        template.update(sql2,newsId);
        String sql3 = "delete from nnews where news_id = ?";
        template.update(sql3,newsId);
    }

    @Override
    public NewsType getDetail(String newsId) {
        try{
            String sql = "select a.news_id, a.author, a.title, a.content, b.type_id, b.type_name from nnews a,ntype b, nnewstype c where c.news_id = a.news_id and c.type_id = b.type_id and a.news_id = ? ";
            return template.queryForObject(sql,new BeanPropertyRowMapper<NewsType>(NewsType.class),newsId);
        }
        catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public List<Type> getAllType() {
        try{
            String sql = "select * from ntype";
            return template.query(sql,new BeanPropertyRowMapper<Type>(Type.class));
        }
        catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public List<NewsType> getByType(Integer typeId) {
        //综合则查询全部
        if (typeId == 1){
            try{
                String sql = "select a.news_id, a.author, a.title, a.content, b.type_id, b.type_name from nnews a,ntype b, nnewstype c where c.news_id = a.news_id and c.type_id = b.type_id";
                return template.query(sql,new BeanPropertyRowMapper<NewsType>(NewsType.class));
            }
            catch (DataAccessException e) {
                return null;
            }
        }
        else{
            try{
                String sql = "select a.news_id, a.author, a.title, a.content, b.type_id, b.type_name from nnews a,ntype b, nnewstype c where c.news_id = a.news_id and c.type_id = b.type_id and c.type_id = ? ";
                return template.query(sql,new BeanPropertyRowMapper<NewsType>(NewsType.class),typeId);
            }
            catch (DataAccessException e) {
                return null;
            }
        }
    }

    @Override
    public void addType(String typeName) {
        String sql = "insert into ntype(type_id,type_name) values(?,?)";
        template.update(sql,null,typeName);
    }

    @Override
    public void modifyType(Type type) {
        String sql = "update ntype set type_name = ? where type_id = ?";
        template.update(sql,type.getTypeName(),type.getTypeId());
    }

    @Override
    public void deleteType(Integer typeId) {
        String sql1 = "update nnewstype set type_id = 1 where type_id = ?";
        template.update(sql1,typeId);
        String sql2 = "delete from ntype where type_id = ?";
        template.update(sql2,typeId);
    }

    @Override
    public void addComment(Comment comment) {
        String sql = "insert into ncomment(id,news_id,user_id,comment) values(?,?,?,?)";
        template.update(sql,null,comment.getNewsId(),comment.getUserId(),comment.getComment());
    }

    @Override
    public List<CommentUser> findCommentList(String newsId) {
        try{
            String sql = "select a.*,b.username from ncomment a,nuser b where a.user_id = b. user_id and a.news_id =?";
            return template.query(sql,new BeanPropertyRowMapper<CommentUser>(CommentUser.class),newsId);
        }
        catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public void deleteComm(Integer id) {
        String sql = "delete from ncomment where id = ?";
        template.update(sql,id);
    }
}
