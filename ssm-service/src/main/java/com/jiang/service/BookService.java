package com.jiang.service;

import java.util.List;

import com.jiang.model.Book;

public interface BookService {
	//查询所有图书信息
	public List<Book> findAllBook();

    //根据编号删除图书
    public int delBook(int id);

    //根据编号查询图书
    public Book findBookById(int id);

    //根据编号修改图书
    public int modify(Book book);
}
