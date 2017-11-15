/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Nguoidung;
import entities.Thongbao;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.NguoidungModel;
import model.ThongbaoModel;

/**
 *
 * @author SONVU
 */
@WebServlet(name = "NguoidungServlet", urlPatterns = {"/NguoidungServlet"})
@MultipartConfig
public class NguoidungServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            String page = "";
            NguoidungModel vm = new NguoidungModel();
            Nguoidung v = new Nguoidung();
            ThongbaoModel tm = new ThongbaoModel();
            HttpSession ses = request.getSession();
            Nguoidung u = (Nguoidung) ses.getAttribute("User");
            if (action.equals("xoa")) {
                int userId = Integer.parseInt(request.getParameter("nguoidungMa"));
                v = vm.thongtin(userId);
                vm.xoa(v);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " xóa người dùng " + v.getNguoidungTen());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachnguoidung.jsp";
            } else if (action.equals("them")) {
                //Vehicle v = new Vehicle();
                //v.setUserId(request.getParameter("vehicleId"));
                v.setNguoidungTen(request.getParameter("nguoidungTen"));
                v.setNguoidungNgaysinh(request.getParameter("nguoidungNgaysinh"));
                v.setNguoidungDiachi(request.getParameter("nguoidungDiachi"));
                v.setNguoidungCmnd(request.getParameter("nguoidungCmnd"));
                v.setNguoidungGioitinh(request.getParameter("nguoidungGioitinh"));
                v.setNguoidungSdt(request.getParameter("nguoidungSdt"));
                v.setNguoidungEmail(request.getParameter("nguoidungEmail"));
                v.setNguoidungTaikhoan(request.getParameter("nguoidungTaikhoan"));
                v.setNguoidungMatkhau(request.getParameter("nguoidungMatkhau"));
                v.setNguoidungQuyen(request.getParameter("nguoidungQuyen"));
                vm.them(v);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " thêm người dùng " + v.getNguoidungTen());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachnguoidung.jsp";
            } else if (action.equals("sua")) {
                v.setNguoidungMa(Integer.parseInt(request.getParameter("nguoidungMa")));
                v.setNguoidungTen(request.getParameter("nguoidungTen"));
                v.setNguoidungNgaysinh(request.getParameter("nguoidungNgaysinh"));
                v.setNguoidungDiachi(request.getParameter("nguoidungDiachi"));
                v.setNguoidungCmnd(request.getParameter("nguoidungCmnd"));
                v.setNguoidungGioitinh(request.getParameter("nguoidungGioitinh"));
                v.setNguoidungSdt(request.getParameter("nguoidungSdt"));
                v.setNguoidungEmail(request.getParameter("nguoidungEmail"));
                v.setNguoidungTaikhoan(request.getParameter("nguoidungTaikhoan"));
                v.setNguoidungMatkhau(request.getParameter("nguoidungMatkhau"));
                v.setNguoidungQuyen(request.getParameter("nguoidungQuyen"));
                vm.sua(v);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " sửa người dùng " + v.getNguoidungTen());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachnguoidung.jsp";
            } else if (action.equals("dangnhap")) {
                String userAccount = request.getParameter("nguoidungTaikhoan");
                String userPass = request.getParameter("nguoidungMatkhau");
                NguoidungModel um = new NguoidungModel();

                boolean result = um.authenticateUser(userAccount, userPass);
                Nguoidung user = um.getUserByUserAccount(userAccount);

                if (result == true) {
                    Thongbao t = new Thongbao();
                    t.setThongbaoNoidung(user.getNguoidungTen() + " đăng nhập");
                    t.setThongbaoThoigian(LocalDateTime.now().toString());
                    tm.them(t);
                    if (user.getNguoidungQuyen().equals("admin")) {
                        //HttpSession ses = request.getSession();
                        ses.setAttribute("User", user);
                        page = "tongquan.jsp";
                    } else if (user.getNguoidungQuyen().equals("member")) {
                        //HttpSession ses = request.getSession();
                        ses.setAttribute("Member", user);
                        page = "index.jsp";
                    }
                } else {
                    page = "dangnhap.jsp?noti=error";
                }
            } else if (action.equals("dangxuat")) {
                //HttpSession ses = request.getSession();
                Nguoidung member = (Nguoidung) ses.getAttribute("Member");
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(member.getNguoidungTen() + " đăng xuất");
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                ses.removeAttribute("Member");
                page = "index.jsp";
            } else if (action.equals("dx")) {
                //HttpSession ses = request.getSession();
                Nguoidung admin = (Nguoidung) ses.getAttribute("User");
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(admin.getNguoidungTen() + " đăng xuất");
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                ses.removeAttribute("User");
                page = "index.jsp";
            } else if (action.equals("dangky")) {
                //Nguoidung u = new Nguoidung();
                v.setNguoidungTen(request.getParameter("nguoidungTen"));
                v.setNguoidungNgaysinh(request.getParameter("nguoidungNgaysinh"));
                v.setNguoidungDiachi(request.getParameter("nguoidungDiachi"));
                v.setNguoidungCmnd(request.getParameter("nguoidungCmnd"));
                v.setNguoidungGioitinh(request.getParameter("nguoidungGioitinh"));
                v.setNguoidungSdt(request.getParameter("nguoidungSdt"));
                v.setNguoidungEmail(request.getParameter("nguoidungEmail"));
                v.setNguoidungTaikhoan(request.getParameter("nguoidungTaikhoan"));
                v.setNguoidungMatkhau(request.getParameter("nguoidungMatkhau"));
                v.setNguoidungQuyen("member");
                boolean result = vm.register(v);
                if (result) {
                    Thongbao t = new Thongbao();
                    t.setThongbaoNoidung(v.getNguoidungTen() + " đăng ký tài khoản " + v.getNguoidungTaikhoan());
                    t.setThongbaoThoigian(LocalDateTime.now().toString());
                    tm.them(t);
                    page = "dangnhap.jsp?noti=success";
                } else {
                    page = "dangky.jsp";
                }
            } else if (action.equals("kiemtra")) {
                String acc = request.getParameter("acc");
                Nguoidung nd = vm.getUserByUserAccount(acc);
                if (acc.length() > 4) {
                    if (vm.isUserExists(nd)) {
                        out.println("Tài khoản đã tồn tại");
                    }
                } else {
                    out.println("Tài khoản có ít nhất 5 kí tự");
                }
            }
            request.getRequestDispatcher(page).include(request, response);

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
