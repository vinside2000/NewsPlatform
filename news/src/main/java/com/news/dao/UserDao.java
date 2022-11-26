package com.news.dao;

import com.news.model.User;

public interface UserDao {
    void addUser(User user);

    void addDefaultUserRole(String usrId);

    User findUsername(String username);

    User login(User user);

    Integer findRoleType(String usrId);
}
