/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Cauhoi;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

/**
 *
 * @author SONVU
 */
public class CauhoiModel {
    
    private final SessionFactory sf = HibernateUtil.getSessionFactory();

    public List<Cauhoi> danhsach() {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            List<Cauhoi> result = sf.getCurrentSession().createCriteria(Cauhoi.class).list();
            sf.getCurrentSession().getTransaction().commit();
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    public Cauhoi thongtin(int rcId) {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            Cauhoi d = (Cauhoi) sf.getCurrentSession().get(Cauhoi.class, rcId);
            sf.getCurrentSession().getTransaction().commit();
            return d;
        } catch (Exception e) {
            return null;
        }
    }
    

    public boolean xoa(Cauhoi d) {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().delete(d);
            sf.getCurrentSession().getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public boolean them(Cauhoi d) {
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

    public boolean sua(Cauhoi d) {
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
    
    public List<Cauhoi> cauHoiTheoHangThi(String userAccount) {
        sf.openSession();
        List<Cauhoi> user = null;
        try {
            sf.getCurrentSession().beginTransaction();
            Query query = sf.getCurrentSession().createQuery("from Cauhoi u where u.cauhoiHangthi = :cauhoiHangthi");
            query.setParameter("cauhoiHangthi", userAccount);
            user = query.list();
            sf.getCurrentSession().getTransaction().commit();
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
        }
        return user;
    }
}
