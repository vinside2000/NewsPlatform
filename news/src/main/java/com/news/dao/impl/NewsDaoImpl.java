package com.news.dao.impl;

import com.news.dao.NewsDao;
import com.news.model.News;
import com.news.model.NewsType;
import com.news.model.UserRole;
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
}
