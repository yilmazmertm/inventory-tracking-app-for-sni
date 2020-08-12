package com.yilmazmertm.DAOLayer;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;

import java.util.List;

public interface DAO {

    public void saveProduct(Product theProduct);

    public List<User> getAllUsers();
}
