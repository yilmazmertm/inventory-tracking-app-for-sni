package com.yilmazmertm.DAOLayer;

import com.yilmazmertm.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO{
    private final SessionFactory sessionFactory;

    public UserDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void saveUser(User user) {
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
    public boolean emailValidation(String email) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> theQuery = currentSession.createQuery("from User where email=:email", User.class);
        theQuery.setParameter("email", email);
        System.out.println("Result list size : " + theQuery.getResultList().size());
        if (theQuery.getResultList().size() == 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void deleteUser(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query theQuery = currentSession.createQuery("delete from User where id=:userId");
        theQuery.setParameter("userId", theId);
        theQuery.executeUpdate();
    }


}
