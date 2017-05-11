package com.jiang.service;

import java.util.List;

import com.jiang.model.Book;

public interface BookService {
	//查询所有图书信息
	public List<Book> findAllBook();
}
