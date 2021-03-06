package com.yilmazmertm.DAOLayer;

import com.yilmazmertm.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Iterator;
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
        return currentSession.get(User.class, user_id);
    }

    @Override
    public void deleteUser(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.remove(getUser(theId));
    }

    @Override
    public boolean emailValidation(String email) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> theQuery = currentSession.createQuery("from User where email=:email", User.class);
        theQuery.setParameter("email", email);
        if (theQuery.getResultList().size() == 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<String> getUserNameSuggestions(String term) {
        List<String> suggestions = new ArrayList<String>();
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> theQuery = currentSession.createQuery("from User where userName LIKE :term", User.class);
        theQuery.setParameter("term", "%" + term + "%");
        for (User user : theQuery.getResultList()) {
            suggestions.add(user.getUserName());
        }
        return suggestions;
    }
}
