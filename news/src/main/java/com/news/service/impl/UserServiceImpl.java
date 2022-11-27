package com.news.service.impl;

import com.news.dao.UserDao;
import com.news.dao.impl.UserDaoImpl;
import com.news.model.User;
import com.news.model.UserRole;
import com.news.service.UserService;

import java.util.List;

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

    @Override
    public List<UserRole> getAll() {
        return dao.getAll();
    }

    @Override
    public void modifyUser(UserRole userRole) {
        dao.modifyUser(userRole);
    }

    @Override
    public void deleteUser(String userId) {
        dao.deleteUser(userId);
    }
}
