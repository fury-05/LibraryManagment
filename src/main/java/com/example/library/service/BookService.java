package com.example.library.service;

import com.example.library.dao.BookDao;
import com.example.library.dao.BorrowRecordDao;
import com.example.library.dao.UserDao;
import com.example.library.model.Book;
import com.example.library.model.BorrowRecord;
import com.example.library.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Service
public class BookService {
    @Autowired
    private BookDao bookDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private BorrowRecordDao borrowRecordDao;

    @Transactional(readOnly = true)
    public List<Book> findAllBooks() {
        return bookDao.findAll();
    }

    @Transactional
    public void addBook(Book book) {
        bookDao.save(book);
    }

    @Transactional
    public void deleteBook(int bookId) {
        bookDao.delete(bookId);
    }

    @Transactional(readOnly = true)
    public List<BorrowRecord> findBorrowsByUserId(int userId) {
        return borrowRecordDao.findByUserId(userId);
    }

    @Transactional
    public String borrowBook(int bookId, int userId) {
        Book book = bookDao.findById(bookId);
        if (book != null && book.getAvailableCopies() > 0) {
            book.setAvailableCopies(book.getAvailableCopies() - 1);
            bookDao.update(book);

            User user = userDao.findById(userId);
            BorrowRecord record = new BorrowRecord();
            record.setBook(book);
            record.setUser(user);
            record.setBorrowDate(LocalDate.now());
            record.setStatus("BORROWED");
            borrowRecordDao.save(record);
            return "Book borrowed successfully!";
        }
        return "Book is not available for borrowing.";
    }

    @Transactional
    public String returnBook(int recordId) {
        BorrowRecord record = borrowRecordDao.findById(recordId);
        if (record != null && "BORROWED".equals(record.getStatus())) {
            record.setStatus("RETURNED");
            record.setReturnDate(LocalDate.now());
            borrowRecordDao.update(record);

            Book book = record.getBook();
            book.setAvailableCopies(book.getAvailableCopies() + 1);
            bookDao.update(book);
            return "Book returned successfully!";
        }
        return "This book has already been returned or the record is invalid.";
    }

    @Transactional(readOnly = true)
    public Map<String, Long> getBookStatsByCategory() {
        return bookDao.getBookCountByCategory();
    }

    @Transactional(readOnly = true)
    public Map<String, Long> getBookAvailabilityStats() {
        return bookDao.getBookAvailabilityStatus();
    }
}