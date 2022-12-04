package com.news.model;

import lombok.Data;

@Data
public class Comment {
    private Integer id;
    private String newsId;
    private String userId;
    private String comment;
}
