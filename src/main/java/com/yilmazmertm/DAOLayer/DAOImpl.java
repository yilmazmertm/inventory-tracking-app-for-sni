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
}
