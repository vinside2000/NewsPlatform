package com.news.model;

import lombok.Data;

@Data
public class UserRole {
    private String userId;
    private String username;
    private String number;
    private Integer roleType;
    private String roleName;


    public void setRoleName() {
        switch (this.roleType){
            case 1:
                this.roleName = "普通用户";
                break;
            case 2:
                this.roleName = "新闻记者";
                break;
            case 3:
                this.roleName = "管理员";
                break;
            default:
                this.roleName = "未识别用户";
                break;
        }
    }
}
