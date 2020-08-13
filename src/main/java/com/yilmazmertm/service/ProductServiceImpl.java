package com.yilmazmertm.service;

import com.yilmazmertm.DAOLayer.DAO;
import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{

    DAO productDao;

    public ProductServiceImpl(DAO productDao) {
        this.productDao = productDao;
    }


    @Override
    @Transactional
    public void saveProduct(Product product) {
        productDao.saveProduct(product);
    }

    @Override
    @Transactional
    public void saveUser(User user) {
        productDao.saveUser(user);
    }

    @Override
    @Transactional
    public List<User> getAllUsers() {
        return productDao.getAllUsers();
    }

    @Override
    @Transactional
    public User getUser(int user_id) {
        return productDao.getUser(user_id);
    }

    @Override
    @Transactional
    public List<Product> getAllProducts() {
        return productDao.getAllProducts();
    }
}
