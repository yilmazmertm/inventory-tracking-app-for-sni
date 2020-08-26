package com.yilmazmertm.service;

import com.yilmazmertm.DAOLayer.ProductDAO;
import com.yilmazmertm.entity.Product;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{

    ProductDAO productDao;

    public ProductServiceImpl(ProductDAO productDao) {
        this.productDao = productDao;
    }

    @Override
    @Transactional
    public void saveProduct(Product product) {
        productDao.saveProduct(product);
    }

    @Override
    @Transactional
    public List<Product> getAllProducts() {
        return productDao.getAllProducts();
    }

    @Override
    @Transactional
    public Product getProduct(int theId) {
        return productDao.getProduct(theId);
    }

    @Override
    @Transactional
    public void deleteProduct(int theId) {
        productDao.deleteProduct(theId);
    }
}
