package com.news.dao;

import com.news.model.Role;

import java.util.List;

public interface RoleDao {
    //获取所有角色信息
    List<Role> getAll();
}
