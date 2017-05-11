package com.jiang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
	 * 分页查询所有图书，使用pageHelper插件完成
	 * @return
	 */
	@RequestMapping("/bookList")
	public ModelAndView bookList(ModelAndView mv,
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize){
		
		Gson gson = new Gson();
		//表示要开始分页了
		//page：从page页开始
		//pageSize：每页显示pageSize条记录
		PageHelper.startPage(page, pageSize);
		mv = new ModelAndView();
		List<Book> list = bookService.findAllBook();
		PageInfo<Book> pageInfo = new PageInfo<Book>(list);
		
		mv.addObject("pageInfo", pageInfo);
		mv.addObject("bookList", list);
		
		System.out.println(gson.toJson(list));
		mv.setViewName("/WEB-INF/pages/bookList.jsp");

		return mv;
	}
}
