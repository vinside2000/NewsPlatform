package com.news.dao.impl;

import com.news.dao.UserDao;
import com.news.model.User;
import com.news.model.UserRole;
import com.news.util.JDBCUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class UserDaoImpl implements UserDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public void addUser(User user) {
        String sql = "insert into nuser(user_id,username,number,password) values(?,?,?,?)";
        template.update(sql,user.getUserId(),user.getUsername(),user.getNumber(),user.getPassword());
    }

    @Override
    public void addDefaultUserRole(String usrId) {
        String sql = "insert into nuserrole(id,role_id,user_id) values(null,?,?)";
        template.update(sql,1,usrId);
    }

    @Override
    public User findUsername(String username) {
        try {
            //定义sql语句
            String sql = "select * from nuser where username = ?";
            return template.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),username);
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public User login(User user) {
        try {
            String sql = "select * from nuser where username = ? and password = ?";
            return template.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),user.getUsername(),user.getPassword());
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public Integer findRoleType(String usrId) {
        try {
            String sql = "select b.role_type from nuser a,nrole b, nuserrole c where a.user_id = ? and c.user_id = a.user_id and c.role_id = b.role_id";
            return template.queryForObject(sql,Integer.class,usrId);
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public List<UserRole> getAll() {
        try{
            String sql = "select a.user_id, a.username, a.number, b.role_type from nuser a,nrole b, nuserrole c where c.user_id = a.user_id and c.role_id = b.role_id";
            return template.query(sql,new BeanPropertyRowMapper<UserRole>(UserRole.class));
        }
        catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public void modifyUser(UserRole userRole) {
        String tmp_sql = "select role_id from nrole where role_type = ?";
        Integer role_id = template.queryForObject(tmp_sql,Integer.class,userRole.getRoleType());
        String sql = "update nuserrole set role_id = ? where user_id = ?";
        template.update(sql,role_id,userRole.getUserId());
    }

    @Override
    public void deleteUser(String userId) {
        String sql1 = "delete from nuserrole where user_id = ?";
        template.update(sql1,userId);
        String sql2 = "delete from nuser where user_id = ?";
        template.update(sql2,userId);
    }
}
