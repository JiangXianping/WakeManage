package com.jiang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jiang.mapper.BookMapper;
import com.jiang.model.Book;
import com.jiang.service.BookService;
/**
 * 
 * @author jiang
 *
 */
@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/bookList")
	public ModelAndView bookList(){
		
		Gson gson = new Gson();
		
		ModelAndView mv = new ModelAndView();
		List<Book> list = bookService.findAllBook();
		
		System.out.println(gson.toJson(list));
		mv.addObject("bookList", list);
		mv.setViewName("bookList.jsp");

		return mv;
	}
}
