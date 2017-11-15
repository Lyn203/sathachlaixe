/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Nguoidung;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

/**
 *
 * @author SONVU
 */
public class NguoidungModel {
    private final SessionFactory sf = HibernateUtil.getSessionFactory();

    public List<Nguoidung> danhsach() {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            List<Nguoidung> result = sf.getCurrentSession().createCriteria(Nguoidung.class).list();
            sf.getCurrentSession().getTransaction().commit();
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    public Nguoidung thongtin(int userId) {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            Nguoidung u = (Nguoidung) sf.getCurrentSession().get(Nguoidung.class, userId);
            sf.getCurrentSession().getTransaction().commit();
            return u;
        } catch (Exception e) {
            return null;
        }
    }

    public Nguoidung getUserByUserAccount(String userAccount) {
        sf.openSession();
        Nguoidung user = null;
        try {
            sf.getCurrentSession().beginTransaction();
            Query query = sf.getCurrentSession().createQuery("from Nguoidung u where u.nguoidungTaikhoan = :nguoidungTaikhoan");
            query.setParameter("nguoidungTaikhoan", userAccount);
            user = (Nguoidung) query.uniqueResult();
            sf.getCurrentSession().getTransaction().commit();
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
        }
        return user;
    }

    public boolean authenticateUser(String userAccount, String userPass) {
        Nguoidung user = getUserByUserAccount(userAccount);
        if (user != null && user.getNguoidungTaikhoan().equals(userAccount) && user.getNguoidungMatkhau().equals(userPass)) {
            return true;
        } else {
            return false;
        }
    }

    public boolean isUserExists(Nguoidung user) {
        sf.openSession();
        boolean result = false;
        try {
            sf.getCurrentSession().beginTransaction();
            Query query = sf.getCurrentSession().createQuery("from Nguoidung u where u.nguoidungTaikhoan = :nguoidungTaikhoan2");
            query.setParameter("nguoidungTaikhoan2", user.getNguoidungTaikhoan());
            Nguoidung u = (Nguoidung) query.uniqueResult();
            sf.getCurrentSession().getTransaction().commit();
            if (u != null) {
                result = true;
            }
        } catch (Exception ex) {
            sf.getCurrentSession().getTransaction().rollback();
        }
        return result;
    }

    public boolean register(Nguoidung user) {
        sf.openSession();
        if (isUserExists(user)) {
            return false;
        }
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().save(user);
            sf.getCurrentSession().getTransaction().commit();
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
        }
        return true;
    }

    public boolean xoa(Nguoidung u) {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().delete(u);
            sf.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public boolean them(Nguoidung u) {
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().save(u);
            sf.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public boolean sua(Nguoidung u) {
//        sf.getCurrentSession().flush();
//        sf.getCurrentSession().clear();
        sf.openSession();
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().update(u);
            sf.getCurrentSession().getTransaction().commit();
            //sf.getCurrentSession().close();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
    
    public Nguoidung getUserByCmnd(String userAccount) {
        sf.openSession();
        Nguoidung user = null;
        try {
            sf.getCurrentSession().beginTransaction();
            Query query = sf.getCurrentSession().createQuery("from Nguoidung u where u.nguoidungCmnd = :nguoidungCmnd");
            query.setParameter("nguoidungCmnd", userAccount);
            user = (Nguoidung) query.uniqueResult();
            sf.getCurrentSession().getTransaction().commit();
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
        }
        return user;
    }
}
