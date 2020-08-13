package com.yilmazmertm.DAOLayer;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DAOImpl implements DAO{

    private SessionFactory sessionFactory;

    public DAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void saveProduct(Product theProduct) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(theProduct);
    }

    @Override
    public void saveUser(User user) {
        System.out.println(user.getId());
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(user);
    }

    @Override
    public List<User> getAllUsers() {

        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> theQuery = currentSession.createQuery("from User", User.class);
        return theQuery.getResultList();
    }

    @Override
    public User getUser(int user_id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> theQuery = currentSession.createQuery("from User where id=:user_id", User.class);
        System.out.println(user_id);
        theQuery.setParameter("user_id", user_id);
        return theQuery.getSingleResult();
    }

    @Override
    public User getUserForUpdate(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        User user = currentSession.get(User.class, theId);
        return user;
    }

    @Override
    public List<Product> getAllProducts() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Product> theQuery = currentSession.createQuery("from Product", Product.class);
        return theQuery.getResultList();
    }

    @Override
    public Product getProduct(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        Product product = currentSession.get(Product.class, theId);
        return product;
    }

    @Override
    public void deleteProduct(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query theQuery = currentSession.createQuery("delete from Product where id=:productId");
        theQuery.setParameter("productId", theId);
        theQuery.executeUpdate();
    }

    @Override
    public void deleteUser(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query theQuery = currentSession.createQuery("delete from User where id=:userId");
        theQuery.setParameter("userId", theId);
        theQuery.executeUpdate();
    }
}
