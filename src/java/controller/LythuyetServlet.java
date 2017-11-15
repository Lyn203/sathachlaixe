/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Lythuyet;
import entities.Nguoidung;
import entities.Thongbao;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LythuyetModel;
import model.NguoidungModel;
import model.ThongbaoModel;

/**
 *
 * @author SONVU
 */
@WebServlet(name = "LythuyetServlet", urlPatterns = {"/LythuyetServlet"})
public class LythuyetServlet extends HttpServlet {

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
            LythuyetModel dm = new LythuyetModel();
            ThongbaoModel tm = new ThongbaoModel();
            HttpSession ses = request.getSession();
            Nguoidung u = (Nguoidung) ses.getAttribute("User");
            if (action.equals("xoa")) {
                int maHoso = Integer.parseInt(request.getParameter("lythuyetMa"));
                Lythuyet d = dm.thongtin(maHoso);
                dm.xoa(d);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " xóa bài thi số " + d.getLythuyetMa());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachlythuyet.jsp";
            } else if (action.equals("them")) {
                Lythuyet d = new Lythuyet();
                //d.setRcId(Integer.parseInt(request.getParameter("hosoMa")));
                d.setLythuyetCmnd(request.getParameter("lythuyetCmnd"));
                d.setLythuyetDapan(request.getParameter("lythuyetDapan"));
                d.setLythuyetKetqua(request.getParameter("lythuyetKetqua"));
                d.setLythuyetNgaythi(request.getParameter("lythuyetNgaythi"));
                dm.them(d);
                Thongbao t = new Thongbao();
                NguoidungModel nd = new NguoidungModel();
                Nguoidung n = nd.getUserByCmnd(d.getLythuyetCmnd());
                if (n == null) {
                    t.setThongbaoNoidung("Khách vãng lai gửi bài thi số " + d.getLythuyetMa());
                } else {
                    t.setThongbaoNoidung(n.getNguoidungTen() + " gửi bài thi số " + d.getLythuyetMa());
                }
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                //page = "danhsachlythuyet.jsp";
            } else if (action.equals("sua")) {
                Lythuyet d = new Lythuyet();
                d.setLythuyetMa(Integer.parseInt(request.getParameter("lythuyetMa")));
                d.setLythuyetCmnd(request.getParameter("lythuyetCmnd"));
                d.setLythuyetDapan(request.getParameter("lythuyetDapan"));
                d.setLythuyetKetqua(request.getParameter("lythuyetKetqua"));
                d.setLythuyetNgaythi(request.getParameter("lythuyetNgaythi"));
                dm.sua(d);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " sửa bài thi số " + d.getLythuyetMa());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachlythuyet.jsp";
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
