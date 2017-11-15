/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DBBackup;

/**
 *
 * @author SONVU
 */
@WebServlet(name = "BackupRestoreDataBase", urlPatterns = {"/BackupRestoreDataBase"})
public class BackupRestoreDataBase extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            if (request.getParameter("backup") != null) {
                System.out.println(request.getParameter("backup"));
                String status = DBBackup.mysqlDatabaseBackUp();
                if (status.equals("y")) {

                    HttpSession session = request.getSession(true);
                    session.setAttribute("currentSessionUser", "");
                    //response.sendRedirect("backupsuccess.jsp");
                    out.println("Sao lưu thành công");
                } else if (status.equals("n")) {
//                    response.sendRedirect("backupfailure.jsp");
                    out.println("Sao lưu thất bại");
                }

            } else if (request.getParameter("restore") != null) {

                String fileName = request.getParameter("file");

                boolean status = DBBackup.mysqlDatabaseRestore("sathachlaixe", "root", "vanthan", "E:\\Hibernate\\SatHachLaiXe\\web\\db\\" + fileName);
                if (status == true) {
                    System.out.println("restore success ");
                    HttpSession session = request.getSession(true);
                    session.setAttribute("currentSessionUser", "");
                    //response.sendRedirect("restoresuccess.jsp");
                    out.println("Phục hồi thành công");
                } else {
                    System.out.println("restore failure ");
//                    response.sendRedirect("restorefailure.jsp");
                    out.println("Phục hồi thất bại");
                }

            }
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
