package com.example.library.dao;

import com.example.library.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public User findByEmail(String email) {
        Query<User> query = sessionFactory.getCurrentSession().createQuery("from User where email = :email", User.class);
        query.setParameter("email", email);
        return query.uniqueResult();
    }

    @Override
    public User findById(int id) {
        return sessionFactory.getCurrentSession().get(User.class, id);
    }

    @Override
    public List<User> findAll() {
        return sessionFactory.getCurrentSession().createQuery("from User", User.class).list();
    }

    @Override
    public List<User> findByApproved(boolean approved) {
        Query<User> query = sessionFactory.getCurrentSession().createQuery("from User where approved = :approved", User.class);
        query.setParameter("approved", approved);
        return query.list();
    }

    @Override
    public void update(User user) {
        sessionFactory.getCurrentSession().update(user);
    }
}