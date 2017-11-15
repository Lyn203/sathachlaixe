/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Thuchanh;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author SONVU
 */
public class ThuchanhModel {

    private final SessionFactory sf = HibernateUtil.getSessionFactory();

    public List<Thuchanh> danhsach() {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            List<Thuchanh> result = sf.getCurrentSession().createCriteria(Thuchanh.class).list();
            sf.getCurrentSession().getTransaction().commit();
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    public Thuchanh thongtin(int rcId) {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            Thuchanh d = (Thuchanh) sf.getCurrentSession().get(Thuchanh.class, rcId);
            sf.getCurrentSession().getTransaction().commit();
            return d;
        } catch (Exception e) {
            return null;
        }
    }
    

    public boolean xoa(Thuchanh d) {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().delete(d);
            sf.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public boolean them(Thuchanh d) {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().save(d);
            sf.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public boolean sua(Thuchanh d) {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().update(d);
            sf.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }    
}
