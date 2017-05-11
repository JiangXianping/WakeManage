package com.jiang.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiang.mapper.BookMapper;
import com.jiang.model.Book;
import com.jiang.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookMapper bookMapper;
	
	@Override
	public List<Book> findAllBook() {
		return bookMapper.findAllBook();
	}

}
