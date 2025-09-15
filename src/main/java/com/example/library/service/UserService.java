package com.example.library.service;

import com.example.library.dao.UserDao;
import com.example.library.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    @Transactional
    public void registerUser(User user) {
        // New users are not approved by default
        user.setApproved(false);
        user.setRole("ROLE_USER");
        // In a real app, you MUST hash the password here.
        // For this project, we store it as plain text.
        userDao.save(user);
    }

    @Transactional(readOnly = true)
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Transactional(readOnly = true)
    public List<User> getPendingUsers() {
        return userDao.findByApproved(false);
    }

    @Transactional(readOnly = true)
    public List<User> getAllUsers() {
        return userDao.findAll();
    }

    @Transactional
    public void approveUser(int userId) {
        User user = userDao.findById(userId);
        if (user != null) {
            user.setApproved(true);
            userDao.update(user);
        }
    }
}