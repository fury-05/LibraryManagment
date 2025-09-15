package com.example.library.dao;

import com.example.library.model.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
public class BookDaoImpl implements BookDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Book> findAll() {
        return sessionFactory.getCurrentSession().createQuery("from Book", Book.class).list();
    }

    @Override
    public Book findById(int id) {
        return sessionFactory.getCurrentSession().get(Book.class, id);
    }

    @Override
    public void save(Book book) {
        sessionFactory.getCurrentSession().save(book);
    }

    @Override
    public void update(Book book) {
        sessionFactory.getCurrentSession().update(book);
    }

    @Override
    public void delete(int id) {
        Book book = findById(id);
        if (book != null) {
            sessionFactory.getCurrentSession().delete(book);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public Map<String, Long> getBookCountByCategory() {
        List<Object[]> results = sessionFactory.getCurrentSession()
                .createQuery("select b.category, count(b) from Book b group by b.category")
                .list();
        return results.stream().collect(Collectors.toMap(
                arr -> (String) arr[0],
                arr -> (Long) arr[1]
        ));
    }

    @Override
    public Map<String, Long> getBookAvailabilityStatus() {
        long available = (Long) sessionFactory.getCurrentSession()
                .createQuery("select sum(b.availableCopies) from Book b where b.availableCopies > 0").uniqueResult();
        long total = (Long) sessionFactory.getCurrentSession()
                .createQuery("select count(b.id) from Book b").uniqueResult();
        // This is a simplified calculation for borrowed.
        // A more accurate way would be to count active borrow_records.
        long borrowed = total - available;

        return Map.of("available", available, "borrowed", borrowed);
    }
}