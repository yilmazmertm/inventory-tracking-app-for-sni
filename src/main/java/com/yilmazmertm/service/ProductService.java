package com.yilmazmertm.service;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;

import java.util.List;

public interface ProductService {

    public void saveProduct(Product product);

    public void saveUser(User user);

    public List<User> getAllUsers();

    User getUser(int user_id);

    List<Product> getAllProducts();
}
