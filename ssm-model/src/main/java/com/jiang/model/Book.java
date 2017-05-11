package com.jiang.model;

import java.util.Date;

public class Book {
    private Integer id;

    private String bookName;

    private String bookAuthor;

    private String bookPublishing;

    private Date bookPublicationDate;

    private Date bookUpdatetime;

    private Integer bookIslend;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName == null ? null : bookName.trim();
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor == null ? null : bookAuthor.trim();
    }

    public String getBookPublishing() {
        return bookPublishing;
    }

    public void setBookPublishing(String bookPublishing) {
        this.bookPublishing = bookPublishing == null ? null : bookPublishing.trim();
    }

    public Date getBookPublicationDate() {
        return bookPublicationDate;
    }

    public void setBookPublicationDate(Date bookPublicationDate) {
        this.bookPublicationDate = bookPublicationDate;
    }

    public Date getBookUpdatetime() {
        return bookUpdatetime;
    }

    public void setBookUpdatetime(Date bookUpdatetime) {
        this.bookUpdatetime = bookUpdatetime;
    }

    public Integer getBookIslend() {
        return bookIslend;
    }

    public void setBookIslend(Integer bookIslend) {
        this.bookIslend = bookIslend;
    }
}