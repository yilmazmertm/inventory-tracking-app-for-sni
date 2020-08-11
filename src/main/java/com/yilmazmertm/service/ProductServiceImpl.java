package com.yilmazmertm.service;

import com.yilmazmertm.DAOLayer.DAO;
import com.yilmazmertm.entity.Product;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductServiceImpl implements ProductService{

    DAO productDao;

    public ProductServiceImpl(DAO productDao) {
        this.productDao = productDao;
    }

    @Transactional
    @Override
    public void saveProduct(Product product) {
        productDao.saveProduct(product);
    }
}
