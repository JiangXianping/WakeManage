package com.jiang.mapper;

import java.util.List;

import com.jiang.model.Book;
import tk.mybatis.mapper.common.Mapper;

public interface BookMapper extends Mapper<Book> {
    //    int deleteByPrimaryKey(Integer id);
//
    int insert(Book record);
//
//    int insertSelective(Book record);
//
//    Book selectByPrimaryKey(Integer id);
//
//    int updateByPrimaryKeySelective(Book record);
//
//    int updateByPrimaryKey(Book record);

//    List<Book> findAllBook();
}