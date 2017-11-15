/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Banner;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

/**
 *
 * @author SONVU
 */
public class BannerModel {
    
    private final SessionFactory sf = HibernateUtil.getSessionFactory();

    public List<Banner> danhsach() {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            List<Banner> result = sf.getCurrentSession().createCriteria(Banner.class).list();
            sf.getCurrentSession().getTransaction().commit();
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    public Banner thongtin(int rcId) {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            Banner d = (Banner) sf.getCurrentSession().get(Banner.class, rcId);
            sf.getCurrentSession().getTransaction().commit();
            return d;
        } catch (Exception e) {
            return null;
        }
    }
    

    public boolean xoa(Banner d) {
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

    public boolean them(Banner d) {
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

    public boolean sua(Banner d) {
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
    
    public List<Banner> bannerTheoTinhTrang(String userAccount) {
        sf.openSession();
        List<Banner> user = null;
        try {
            sf.getCurrentSession().beginTransaction();
            Query query = sf.getCurrentSession().createQuery("from Banner u where u.bannerTinhtrang = :bannerTinhtrang");
            query.setParameter("bannerTinhtrang", userAccount);
            user = query.list();
            sf.getCurrentSession().getTransaction().commit();
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
        }
        return user;
    }
}
