package com.yilmazmertm.service;

import com.yilmazmertm.entity.User;

import java.util.List;

public interface UserService {

    public void saveUser(User user);

    public List<User> getAllUsers();

    User getUser(int user_id);

    void deleteUser(int theId);

    boolean emailValidation(String email);

    List<String> getUserNameSuggestions(String term);
}
