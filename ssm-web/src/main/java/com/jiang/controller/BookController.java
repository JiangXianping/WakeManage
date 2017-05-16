package com.jiang.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.jiang.model.Book;
import com.jiang.service.BookService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * @author jiang
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    Gson gson = new Gson();

/*    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }*/
/*    @InitBinder
    public void initBinder1(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }*/

    @RequestMapping("/addBook")
    public String addBook(Book book) {
        int num = bookService.addBook(book);
        if (num == 1) {
            return "redirect:/book/bookList";
        }
        return "redirect:/book/bookList";
    }

    @RequestMapping(value = "/modify", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView modify(Book book) {
        ModelAndView mv = new ModelAndView();
        System.out.println(gson.toJson(book));
        if (book.getId() != null) {
            bookService.modify(book);
            mv.setViewName("redirect:/book/bookList");
        }
        return mv;
    }

    /**
     * 删除图书
     *
     * @param id 编号
     * @return 删除成功之后，重定向到查询所有
     */
    @RequestMapping("/del/{id}")
    public String del(@PathVariable("id") int id) {
        int num = bookService.delBook(id);
        if (num == 1) {
            return "redirect:/book/bookList";
        }
        return "redirect:/book/bookList";
    }

    /**
     * 根据id查询
     *
     * @param id 编号
     * @return 返回到editBook.jsp页面进行修改
     */
    @RequestMapping("/findBookById/{id}")
    public ModelAndView findBookById(@PathVariable("id") int id) {
        ModelAndView mv = new ModelAndView();
        Book book = bookService.findBookById(id);
        mv.addObject("book", book);
        mv.setViewName("editBook.jsp");

        return mv;

    }

    /**
     * 使用PageHelper实现分页功能
     *
     * @return
     */
    @RequestMapping("/bookList")
    public ModelAndView bookList(ModelAndView mv,
                                 @RequestParam(required = true, defaultValue = "1") Integer page,
                                 @RequestParam(required = true, defaultValue = "10") Integer pageSize) {

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
        mv.setViewName("bookList.jsp");

        return mv;
    }
}
