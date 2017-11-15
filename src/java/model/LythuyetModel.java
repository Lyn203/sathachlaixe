/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Lythuyet;
import entities.Tailieu;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

/**
 *
 * @author SONVU
 */
public class LythuyetModel {

    private final SessionFactory sf = HibernateUtil.getSessionFactory();

    public List<Lythuyet> danhsach() {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            List<Lythuyet> result = sf.getCurrentSession().createCriteria(Lythuyet.class).list();
            sf.getCurrentSession().getTransaction().commit();
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    public Lythuyet thongtin(int rcId) {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            Lythuyet d = (Lythuyet) sf.getCurrentSession().get(Lythuyet.class, rcId);
            sf.getCurrentSession().getTransaction().commit();
            return d;
        } catch (Exception e) {
            return null;
        }
    }

    public boolean xoa(Lythuyet d) {
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

    public boolean them(Lythuyet d) {
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

    public boolean sua(Lythuyet d) {
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

    public List<Lythuyet> lyThuyetTheoCmnd(String userAccount) {
        sf.openSession();
        List<Lythuyet> user = null;
        try {
            sf.getCurrentSession().beginTransaction();
            Query query = sf.getCurrentSession().createQuery("from Lythuyet u where u.lythuyetCmnd = :lythuyetCmnd");
            query.setParameter("lythuyetCmnd", userAccount);
            user = query.list();
            sf.getCurrentSession().getTransaction().commit();
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
        }
        return user;
    }
}
