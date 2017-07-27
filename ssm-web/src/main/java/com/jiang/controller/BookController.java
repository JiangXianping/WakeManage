package com.jiang.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import java.util.List;

import com.jiang.model.User;
import com.jiang.util.DateUtil;
import com.jiang.util.MsgUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
import javax.servlet.http.HttpSession;


/**
 * @author jiang
 */
@Controller
@RequestMapping("/book")
public class BookController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
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

//    @RequestMapping("/addBook")
//    public String addBook(Book book) {
//        int num = bookService.addBook(book);
//        if (num == 1) {
//            return "redirect:/book/bookList";
//        }
//        return "redirect:/book/bookList";
//    }

    @ResponseBody
    @RequestMapping("/addBook")
    public MsgUtil addBook(Book book){
        System.out.print("addBook"+book.getBookPublishing()+" "+book.getBookUpdatetime()+" "+book.getBookPublicationDate());
        bookService.addBook(book);
        return MsgUtil.success();
    }

    @RequestMapping(value = "/modify", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView modify(Book book) {
        ModelAndView mv = new ModelAndView();
        logger.info(gson.toJson(book));
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
     * 需要导入jackson jar
     * @param mv
     * @param page
     * @param pageSize
     * @return
     */
    @ResponseBody
    @RequestMapping("/bookList")
    public MsgUtil bookListWithJson(ModelAndView mv,
                        @RequestParam(required = true, defaultValue = "1") Integer page,
                        @RequestParam(required = true, defaultValue = "10") Integer pageSize){
        //表示开始分页
        //page:第几页
        //pageSize:每页显示多少

        PageHelper.startPage(page, pageSize);
        mv = new ModelAndView();
        List<Book> list = bookService.findAllBook();
        PageInfo<Book> pageInfo = new PageInfo<Book>(list);

        mv.addObject("pageInfo", pageInfo);
//        mv.addObject("bookList", list);

        System.out.println(gson.toJson(pageInfo));
//        mv.setViewName("bookList.jsp");

        return MsgUtil.success().add("pageInfo",pageInfo);
    }

    /**
     * 使用PageHelper实现分页功能
     *
     * @return
     */
//    @RequestMapping("/bookList")
//    public ModelAndView bookList(ModelAndView mv,
//                                 @RequestParam(required = true, defaultValue = "1") Integer page,
//                                 @RequestParam(required = true, defaultValue = "10") Integer pageSize) {
//
//        //表示开始分页
//        //page:第几页
//        //pageSize:每页显示多少
//
//        PageHelper.startPage(page, pageSize);
//        mv = new ModelAndView();
//        List<Book> list = bookService.findAllBook();
//        PageInfo<Book> pageInfo = new PageInfo<Book>(list);
//
//        mv.addObject("pageInfo", pageInfo);
//        mv.addObject("bookList", list);
//
//        System.out.println(gson.toJson(pageInfo));
//        mv.setViewName("bookList.jsp");
//
//        return mv;
//    }

    /**
     * 导出当前页到Excel文件
     *
     * @param response
     * @param session
     */
    @RequestMapping("/exportCurrPage")
    public void export(HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
        // 只是让浏览器知道要保存为什么文件而已，真正的文件还是在流里面的数据，你设定一个下载类型并不会去改变流里的内容。
        //而实际上只要你的内容正确，文件后缀名之类可以随便改，就算你指定是下载excel文件，下载时我也可以把他改成pdf等。
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode("图书信息" + DateUtil.getNowTime("yyyy-MM-dd") + ".xls", "UTF-8"));
        User currUser = (User) session.getAttribute("currUser");
        logger.debug("当前登录的用户：" + currUser);

        List<Book> bookList = this.bookService.findAllBook();
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建一个sheet页
        Sheet sheet = wb.createSheet("图书信息");
        //创建标题行
        Row row = sheet.createRow(0);
        row.createCell(0).setCellValue("图书编号");
        row.createCell(1).setCellValue("图书名称");
        row.createCell(2).setCellValue("图书作者");
        row.createCell(3).setCellValue("出版社");
        row.createCell(4).setCellValue("出版日期");
        row.createCell(5).setCellValue("更新时间");
        row.createCell(6).setCellValue("状态");

        // 定义样式
        CellStyle titleCellStyle = wb.createCellStyle();
        //设置水平文本居中
        titleCellStyle.setAlignment(HorizontalAlignment.CENTER);
        //设置是否换行
        titleCellStyle.setWrapText(false);
        //设置背景颜色
        titleCellStyle.setFillBackgroundColor(HSSFColor.YELLOW.index);
        //设置字体
        HSSFFont font = wb.createFont();
        font.setColor(HSSFColor.BLUE.index);
        font.setFontName("微软雅黑");
        font.setBold(true);
        titleCellStyle.setFont(font);

        //设置宽度
        sheet.setDefaultColumnWidth(25);
        row.getCell(0).setCellStyle(titleCellStyle);
        row.getCell(1).setCellStyle(titleCellStyle);
        row.getCell(2).setCellStyle(titleCellStyle);
        row.getCell(3).setCellStyle(titleCellStyle);
        row.getCell(4).setCellStyle(titleCellStyle);
        row.getCell(5).setCellStyle(titleCellStyle);
        row.getCell(6).setCellStyle(titleCellStyle);

        for (int i = 1; i <= bookList.size(); i++) {
            Book book = bookList.get(i - 1);
            row = sheet.createRow(i);
            row.createCell(0).setCellValue(book.getId());
            row.createCell(1).setCellValue(book.getBookName());
            row.createCell(2).setCellValue(book.getBookAuthor());
            row.createCell(3).setCellValue(book.getBookPublishing());
            row.createCell(4).setCellValue(DateUtil.dateToStr(book.getBookPublicationDate()));
            row.createCell(5).setCellValue(DateUtil.dateToStr(book.getBookUpdatetime()));
            row.createCell(6).setCellValue(book.getBookIslend() == 0 ? "未借出" : "已借出");
        }

        try {
            OutputStream ost = response.getOutputStream();
            wb.write(ost);
            ost.flush();
            ost.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}