/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Thongbao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ThongbaoModel;

/**
 *
 * @author SONVU
 */
@WebServlet(name = "ThongbaoServlet", urlPatterns = {"/ThongbaoServlet"})
public class ThongbaoServlet extends HttpServlet {

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
            ThongbaoModel dm = new ThongbaoModel();
            if (action.equals("xoa")) {
                int maHoso = Integer.parseInt(request.getParameter("thongbaoMa"));
                Thongbao d = dm.thongtin(maHoso);
                dm.xoa(d);
                page = "danhsachdmtl.jsp";
            } else if (action.equals("them")) {
                Thongbao d = new Thongbao();
                //d.setRcId(Integer.parseInt(request.getParameter("hosoMa")));
                d.setThongbaoNoidung(request.getParameter("thongbaoNoidung"));
                d.setThongbaoThoigian(request.getParameter("thongbaoThoigian"));
                dm.them(d);
                page = "danhsachdmtl.jsp";
            } else if (action.equals("sua")) {
                Thongbao d = new Thongbao();
                d.setThongbaoMa(Integer.parseInt(request.getParameter("thongbaoMa")));
                d.setThongbaoNoidung(request.getParameter("thongbaoNoidung"));
                d.setThongbaoThoigian(request.getParameter("thongbaoThoigian"));
                dm.sua(d);
                page = "danhsachdmtl.jsp";
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
