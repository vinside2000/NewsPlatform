package com.news.model;

import lombok.Data;

@Data
public class CommentUser {
    private Integer id;
    private String newsId;
    private String userId;
    private String comment;
    private String username;
}
