package com.yilmazmertm.DAOLayer;

import com.yilmazmertm.entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO {

    private final SessionFactory sessionFactory;

    public ProductDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void saveProduct(Product theProduct) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(theProduct);
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
        return currentSession.get(Product.class, theId);
    }

    @Override
    public void deleteProduct(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query theQuery = currentSession.createQuery("delete from Product where id=:productId");
        theQuery.setParameter("productId", theId);
        theQuery.executeUpdate();
    }

    @Override
    public Product getProductDetail(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Product> theQuery = currentSession.createQuery("from Product where id=:productId", Product.class);
        theQuery.setParameter("productId", theId);
        return theQuery.getSingleResult();
    }


}
