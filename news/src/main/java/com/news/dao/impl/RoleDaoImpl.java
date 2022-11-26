package com.news.dao.impl;

import com.news.dao.RoleDao;
import com.news.model.Role;
import com.news.util.JDBCUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class RoleDaoImpl implements RoleDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<Role> getAll() {
        try{
            String sql = "select * from nrole";
            return template.query(sql,new BeanPropertyRowMapper<Role>(Role.class));
        }
        catch (DataAccessException e) {
            return null;
        }
    }
}
