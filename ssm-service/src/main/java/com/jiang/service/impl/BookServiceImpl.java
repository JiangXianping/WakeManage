package com.jiang.service.impl;

import com.jiang.mapper.BookMapper;
import com.jiang.model.Book;
import com.jiang.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;




@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookMapper bookMapper;

    @Override
    public List<Book> findAllBook() {
        return bookMapper.selectAll();
    }

    @Override
    public int delBook(int id) {
        return bookMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Book findBookById(int id) {
        return bookMapper.selectByPrimaryKey(id);
    }

    @Override
    public int modify(Book book) {
        return bookMapper.updateByPrimaryKey(book);
    }

    @Override
    public int addBook(Book book) {
        return bookMapper.insert(book);
    }
}
