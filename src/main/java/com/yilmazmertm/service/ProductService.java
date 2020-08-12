package com.yilmazmertm.service;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;

import java.util.List;

public interface ProductService {

    public void saveProduct(Product product);

    public List<User> getAllUsers();
}
