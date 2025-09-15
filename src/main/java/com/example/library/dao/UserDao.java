package com.example.library.dao;

import com.example.library.model.User;
import java.util.List;

public interface UserDao {
    void save(User user);
    User findByEmail(String email);
    User findById(int id);
    List<User> findAll();
    List<User> findByApproved(boolean approved);
    void update(User user);
}