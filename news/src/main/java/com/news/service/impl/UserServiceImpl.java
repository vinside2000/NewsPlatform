package com.news.service.impl;

import com.news.dao.UserDao;
import com.news.dao.impl.UserDaoImpl;
import com.news.model.User;
import com.news.service.UserService;

public class UserServiceImpl implements UserService {
    UserDao dao = new UserDaoImpl();
    @Override
    public void addUser(User user) {
        dao.addUser(user);
        dao.addDefaultUserRole(user.getUserId());
    }

    @Override
    public User findUsername(String username) {
        return dao.findUsername(username);
    }

    @Override
    public User login(User user) {
        return dao.login(user);
    }

    @Override
    public Integer findRoleType(String usrId) {
        return dao.findRoleType(usrId);
    }
}
