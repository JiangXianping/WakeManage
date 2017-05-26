package com.jiang.mapper;

import java.util.List;

import com.jiang.model.Book;
import org.apache.ibatis.annotations.Insert;
import tk.mybatis.mapper.common.Mapper;

public interface BookMapper extends Mapper<Book> {

    int insert(Book record);

}