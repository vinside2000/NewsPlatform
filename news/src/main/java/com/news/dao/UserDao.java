package com.news.dao;

import com.news.model.User;
import com.news.model.UserRole;

import java.util.List;

public interface UserDao {
    void addUser(User user);

    void addDefaultUserRole(String usrId);

    User findUsername(String username);

    User login(User user);

    Integer findRoleType(String usrId);

    List<UserRole> getAll();

    void modifyUser(UserRole userRole);

    void deleteUser(String userId);
}
