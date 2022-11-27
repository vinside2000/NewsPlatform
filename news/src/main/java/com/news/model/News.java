package com.news.model;

import lombok.Data;

@Data
public class News {
    private String newsId;
    private String author;
    private String title;
    private String content;
}
