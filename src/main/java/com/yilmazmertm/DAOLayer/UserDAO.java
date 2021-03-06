package com.yilmazmertm.DAOLayer;

import com.yilmazmertm.entity.User;

import java.util.List;

public interface UserDAO {

    public void saveUser(User user);

    void deleteUser(int theId);

    public List<User> getAllUsers();

    public User getUser(int user_id);

    boolean emailValidation(String email);

    List<String> getUserNameSuggestions(String term);
}
