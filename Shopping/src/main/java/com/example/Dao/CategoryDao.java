package com.example.Dao;

import com.example.entities.Categories;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.persistence.Query;
import java.util.List;

public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    //save category to db
    public int saveCategory(Categories cat)
    {

        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId = (int) session.save(cat);
        tx.commit();
        session.close();
        return catId;
    }

    public List<Categories> getCategories()
    {
       Session s = this.factory.openSession();
       Query query = s.createQuery("from Categories");
       List<Categories> list = query.getResultList();
       return list;

    }

    public Categories getCategoriesById(int cid)
    {
        Categories cat = null;
        try
        {

            Session session = this.factory.openSession();
            cat = session.get(Categories.class,cid);
            session.close();

        }catch (Exception e)
        {
            e.printStackTrace();
        }

        return cat;
    }
}
