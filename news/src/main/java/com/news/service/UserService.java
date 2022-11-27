package com.news.service;

import com.news.model.User;
import com.news.model.UserRole;

import java.util.List;

public interface UserService {
    /**
     * 用户注册
     * @param user
     */
    void addUser(User user);

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    User findUsername(String username);

    /**
     * 校验用户登录
     * @param user
     * @return
     */
    User login(User user);

    /**
     * 获取用户的角色
     * @param usrId
     * @return
     */
    Integer findRoleType(String usrId);

    /**
     * 获取全部用户以及角色
     * @return
     */
    List<UserRole> getAll();

    /**
     * 修改用户
     * @param userRole
     */
    void modifyUser(UserRole userRole);

    /**
     * 删除用户
     * @param userId
     */
    void deleteUser(String userId);
}
