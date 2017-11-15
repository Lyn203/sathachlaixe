/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Nguoidung;
import entities.Thongbao;
import entities.Thuchanh;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ThongbaoModel;
import model.ThuchanhModel;

/**
 *
 * @author SONVU
 */
@WebServlet(name = "ThuchanhServlet", urlPatterns = {"/ThuchanhServlet"})
public class ThuchanhServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter writer = response.getWriter()) {
            String action = request.getParameter("action");
            String page = "";
            ThuchanhModel dm = new ThuchanhModel();
            ThongbaoModel tm = new ThongbaoModel();
            HttpSession ses = request.getSession();
            Nguoidung u = (Nguoidung) ses.getAttribute("User");
            if (action.equals("xoa")) {
                int maHoso = Integer.parseInt(request.getParameter("thuchanhMa"));
                Thuchanh d = dm.thongtin(maHoso);
                dm.xoa(d);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " xóa lịch thực hành số " + d.getThuchanhMa());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachthuchanh.jsp";
            } else if (action.equals("them")) {
                Thuchanh d = new Thuchanh();
                //d.setRcId(Integer.parseInt(request.getParameter("hosoMa")));
                d.setThuchanhNgay(request.getParameter("thuchanhNgay"));
                d.setThuchanhDiadiem(request.getParameter("thuchanhDiadiem"));
                d.setThuchanhTinhtp(request.getParameter("thuchanhTinhtp"));
                dm.them(d);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " thêm lịch thực hành số " + d.getThuchanhMa());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachthuchanh.jsp";
            } else if (action.equals("sua")) {
                Thuchanh d = new Thuchanh();
                d.setThuchanhMa(Integer.parseInt(request.getParameter("thuchanhMa")));
                d.setThuchanhNgay(request.getParameter("thuchanhNgay"));
                d.setThuchanhDiadiem(request.getParameter("thuchanhDiadiem"));
                d.setThuchanhTinhtp(request.getParameter("thuchanhTinhtp"));
                dm.sua(d);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " sửa lịch thực hành số " + d.getThuchanhMa());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachthuchanh.jsp";
            }
            request.getRequestDispatcher(page).forward(request, response);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
