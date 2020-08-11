package com.yilmazmertm;

import com.yilmazmertm.entity.Product;
import com.yilmazmertm.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.Date;

public class CreateSampleData {

    public static void main(String[] args) {
        SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Product.class).addAnnotatedClass(User.class).buildSessionFactory();
        Session session = factory.getCurrentSession();

        try {
            Product product = new Product("Laptop", "Dell", "Me", "Me", "Me");
            // User user = new User("Mert", "Yılmaz", "ROLE_USER");
            User user2 = new User("Yeni", "Id" , "ROLE_USER");
            product.setUser(user2);
            session.beginTransaction();
            session.save(product);
            session.save(user2);
            session.getTransaction().commit();
        } finally {
            factory.close();
            session.close();
        }
    }
}
