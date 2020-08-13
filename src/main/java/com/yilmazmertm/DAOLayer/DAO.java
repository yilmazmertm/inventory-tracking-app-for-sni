package com.yilmazmertm.DAOLayer;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;

import java.util.List;

public interface DAO {

    public void saveProduct(Product theProduct);

    public void saveUser(User user);

    public List<User> getAllUsers();

    public User getUser(int user_id);

    User getUserForUpdate(int theId);

    List<Product> getAllProducts();

    Product getProduct(int theId);

    void deleteProduct(int theId);

    void deleteUser(int theId);
}
