package com.news.service;

import com.news.model.User;

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
}
