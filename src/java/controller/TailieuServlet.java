/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Nguoidung;
import entities.Tailieu;
import entities.Thongbao;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.TailieuModel;
import model.ThongbaoModel;

/**
 *
 * @author SONVU
 */
@WebServlet(name = "TailieuServlet", urlPatterns = {"/TailieuServlet"})
@MultipartConfig
public class TailieuServlet extends HttpServlet {

    private final static Logger LOGGER
            = Logger.getLogger(TailieuServlet.class.getCanonicalName());

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
            TailieuModel dm = new TailieuModel();
            ThongbaoModel tm = new ThongbaoModel();
            HttpSession ses = request.getSession();
            Nguoidung u = (Nguoidung) ses.getAttribute("User");
            if (action.equals("xoa")) {
                int maHoso = Integer.parseInt(request.getParameter("tailieuMa"));
                Tailieu d = dm.thongtin(maHoso);
                dm.xoa(d);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " xóa tài liệu " + d.getTailieuTen());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachtailieu.jsp";
            } else if (action.equals("them")) {
                // Create path components to save the file
                final String path = "E:\\Hibernate\\SatHachLaiXe\\web\\upload\\file";
                final Part filePart = request.getPart("tailieuTaptin");
                final String fileName = getFileName(filePart);

                OutputStream out = null;
                InputStream filecontent = null;

                try {
                    out = new FileOutputStream(new File(path + File.separator
                            + fileName));
                    filecontent = filePart.getInputStream();

                    int read = 0;
                    final byte[] bytes = new byte[1024];

                    while ((read = filecontent.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
//                    writer.println("New file " + fileName + " created at " + path);
//                    LOGGER.log(Level.INFO, "File{0}being uploaded to {1}",
//                            new Object[]{fileName, path});
                } catch (FileNotFoundException fne) {
//                    writer.println("You either did not specify a file to upload or are "
//                            + "trying to upload a file to a protected or nonexistent "
//                            + "location.");
//                    writer.println("<br/> ERROR: " + fne.getMessage());

                    LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                            new Object[]{fne.getMessage()});
                } finally {
                    if (out != null) {
                        out.close();
                    }
                    if (filecontent != null) {
                        filecontent.close();
                    }
                }

                Tailieu d = new Tailieu();
                //d.setRcId(Integer.parseInt(request.getParameter("hosoMa")));
                d.setTailieuTen(request.getParameter("tailieuTen"));
                d.setTailieuTomtat(request.getParameter("tailieuTomtat"));
                d.setTailieuNoidung(request.getParameter("tailieuNoidung"));
                d.setTailieuDanhmuc(request.getParameter("tailieuDanhmuc"));
                d.setTailieuTaptin(fileName);
                dm.them(d);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " thêm tài liệu " + d.getTailieuTen());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachtailieu.jsp";
            } else if (action.equals("sua")) {
                Tailieu d = new Tailieu();
                d.setTailieuMa(Integer.parseInt(request.getParameter("tailieuMa")));
                d.setTailieuTen(request.getParameter("tailieuTen"));
                d.setTailieuTomtat(request.getParameter("tailieuTomtat"));
                d.setTailieuNoidung(request.getParameter("tailieuNoidung"));
                d.setTailieuDanhmuc(request.getParameter("tailieuDanhmuc"));
                d.setTailieuTaptin(request.getParameter("tailieuTaptin"));
                dm.sua(d);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " sửa tài liệu " + d.getTailieuTen());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachtailieu.jsp";
            } else if (action.equals("chitiet")) {
                page = "chitiettailieu.jsp?tailieuMa=" + request.getParameter("tailieuMa");
            }
            request.getRequestDispatcher(page).forward(request, response);

        }

    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
