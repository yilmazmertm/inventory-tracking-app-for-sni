package com.yilmazmertm.DAOLayer;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;

import java.util.List;

public interface ProductDAO {

    public void saveProduct(Product theProduct);

    List<Product> getAllProducts();

    Product getProduct(int theId);

    void deleteProduct(int theId);
}
