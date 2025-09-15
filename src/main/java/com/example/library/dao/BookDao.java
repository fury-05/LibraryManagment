package com.example.library.dao;

import com.example.library.model.Book;
import java.util.List;
import java.util.Map;

public interface BookDao {
    List<Book> findAll();
    Book findById(int id);
    void save(Book book);
    void update(Book book);
    void delete(int id);
    Map<String, Long> getBookCountByCategory();
    Map<String, Long> getBookAvailabilityStatus();
}