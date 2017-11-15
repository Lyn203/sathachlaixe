/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Tailieu;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

/**
 *
 * @author SONVU
 */
public class TailieuModel {

    private final SessionFactory sf = HibernateUtil.getSessionFactory();

    public List<Tailieu> danhsach() {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            List<Tailieu> result = sf.getCurrentSession().createCriteria(Tailieu.class).list();
            sf.getCurrentSession().getTransaction().commit();
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    public Tailieu thongtin(int rcId) {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            Tailieu d = (Tailieu) sf.getCurrentSession().get(Tailieu.class, rcId);
            sf.getCurrentSession().getTransaction().commit();
            return d;
        } catch (Exception e) {
            return null;
        }
    }

    public boolean xoa(Tailieu d) {
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

    public boolean them(Tailieu d) {
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

    public boolean sua(Tailieu d) {
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

    public List<Tailieu> taiLieuTheoDanhMuc(String userAccount) {
        sf.openSession();
        List<Tailieu> user = null;
        try {
            sf.getCurrentSession().beginTransaction();
            Query query = sf.getCurrentSession().createQuery("from Tailieu u where u.tailieuDanhmuc = :tailieuDanhmuc");
            query.setParameter("tailieuDanhmuc", userAccount);
            user = query.list();
            sf.getCurrentSession().getTransaction().commit();
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
        }
        return user;
    }
}
