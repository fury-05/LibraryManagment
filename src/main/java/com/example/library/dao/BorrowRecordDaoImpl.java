package com.example.library.dao;

import com.example.library.model.BorrowRecord;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class BorrowRecordDaoImpl implements BorrowRecordDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(BorrowRecord record) {
        sessionFactory.getCurrentSession().save(record);
    }

    @Override
    public BorrowRecord findById(int id) {
        return sessionFactory.getCurrentSession().get(BorrowRecord.class, id);
    }

    @Override
    public List<BorrowRecord> findByUserId(int userId) {
        Query<BorrowRecord> query = sessionFactory.getCurrentSession().createQuery("from BorrowRecord br where br.user.id = :userId order by br.borrowDate desc", BorrowRecord.class);
        query.setParameter("userId", userId);
        return query.list();
    }

    @Override
    public void update(BorrowRecord record) {
        sessionFactory.getCurrentSession().update(record);
    }
}