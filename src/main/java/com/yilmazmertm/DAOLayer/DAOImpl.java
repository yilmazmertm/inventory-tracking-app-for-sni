package com.yilmazmertm.DAOLayer;

import com.yilmazmertm.entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

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
}
