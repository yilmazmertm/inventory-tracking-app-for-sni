package com.yilmazmertm.service;

import com.yilmazmertm.DAOLayer.UserDAO;
import com.yilmazmertm.entity.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    UserDAO userDao;

    public UserServiceImpl(UserDAO userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    @Transactional
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    @Override
    @Transactional
    public User getUser(int user_id) {
        return userDao.getUser(user_id);
    }

    @Override
    @Transactional
    public void deleteUser(int theId) {
        userDao.deleteUser(theId);
    }

    @Override
    @Transactional
    public User getUserForUpdate(int theId) {
        return userDao.getUserForUpdate(theId);
    }

    @Override
    public boolean emailValidation(String email) {
        return userDao.emailValidation(email);
    }
}
