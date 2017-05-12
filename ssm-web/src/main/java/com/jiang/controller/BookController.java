package com.jiang.controller;

import java.util.List;

import javafx.print.Printer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.jiang.model.Book;
import com.jiang.service.BookService;

import javax.servlet.http.HttpServletResponse;

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

    @RequestMapping("/del/{id}")
    public String del(@PathVariable("id") int id, HttpServletResponse response) {
        int num = bookService.delBook(id);
        if (num == 1) {
            return "redirect:/book/bookList";
        }
        return "redirect:/book/bookList";
    }

	/**
	 * 使用PageHelper实现分页功能
	 * @return
	 */
	@RequestMapping("/bookList")
	public ModelAndView bookList(ModelAndView mv,
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="10") Integer pageSize){
		
		Gson gson = new Gson();
		//表示开始分页
		//page:第几页
		//pageSize:每页显示多少

		PageHelper.startPage(page, pageSize);
		mv = new ModelAndView();
		List<Book> list = bookService.findAllBook();
		PageInfo<Book> pageInfo = new PageInfo<Book>(list);
		
		mv.addObject("pageInfo", pageInfo);
		mv.addObject("bookList", list);
		
		System.out.println(gson.toJson(pageInfo));
		mv.setViewName("/WEB-INF/pages/bookList.jsp");

		return mv;
	}
}
