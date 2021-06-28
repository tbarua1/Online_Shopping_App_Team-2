package com.example.Dao;

import com.example.entities.Customer;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.Query;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    //get user by email and password
    public Customer getCustomerByEmailAndPassword(String email,String password)
    {
        Customer customer=null;

        try {
            String query="from Customer where email = :e and password= :p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);

            customer = (Customer) q.getSingleResult();


            session.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return customer;
    }
}
