package com.news.model;

import lombok.Data;

@Data
public class NewsType {
    private String newsId;
    private String author;
    private String title;
    private String content;
    private Integer typeId;
    private String typeName;
}
