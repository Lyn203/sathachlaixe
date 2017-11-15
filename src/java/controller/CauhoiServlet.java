/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Cauhoi;
import entities.Nguoidung;
import entities.Thongbao;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Calendar;
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
import static jdk.nashorn.internal.objects.ArrayBufferView.buffer;
import model.CauhoiModel;
import model.ThongbaoModel;

/**
 *
 * @author SONVU
 */
@WebServlet(name = "CauhoiServlet", urlPatterns = {"/CauhoiServlet"})
@MultipartConfig
public class CauhoiServlet extends HttpServlet {

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
            CauhoiModel dm = new CauhoiModel();
            ThongbaoModel tm = new ThongbaoModel();
            HttpSession ses = request.getSession();
            Nguoidung u = (Nguoidung) ses.getAttribute("User");
            if (action.equals("xoa")) {
                int id = Integer.parseInt(request.getParameter("cauhoiMa"));
                Cauhoi d = dm.thongtin(id);
                boolean isXoa = dm.xoa(d);
                if (isXoa) {
                    Thongbao t = new Thongbao();
                    t.setThongbaoNoidung(u.getNguoidungTen() + " xóa câu hỏi số " + d.getCauhoiMa());
                    t.setThongbaoThoigian(LocalDateTime.now().toString());
                    tm.them(t);
                }
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung("Xóa không thành công");
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachcauhoi" + request.getParameter("cauhoiHangthi") + ".jsp";
            } else if (action.equals("them")) {
                // Create path components to save the file
                String imageName=Calendar.getInstance().getTimeInMillis()+".JPG";
                final String path = "E:\\portal\\SatHachLaiXe\\SatHachLaiXe\\web\\upload\\question\\"+imageName;
                final Part filePart = request.getPart("cauhoiAnh");
                final String fileName = getFileName(filePart);

                OutputStream out = null;
                InputStream filecontent = null;

                try {
                    File coppyFile=new File(path);
                    File rootFile=new File("E:\\portal\\SatHachLaiXe\\image\\noimage.JPG");
                    out = new FileOutputStream(coppyFile);
                    filecontent = filePart.getInputStream();
                    byte[] bytes = new byte[1024];

                    int length;
                    // Copy the file content in bytes.
                    // Sao chep nội dung tập tin dưới dạng bytes.
                    while ((length = filecontent.read(bytes)) > 0) {

                        out.write(bytes, 0, length);

                    }

                    filecontent.close();
                    out.close();

                    System.out.println("File copy is successful!");

                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    if (out != null) {
                        out.close();
                    }
                    if (filecontent != null) {
                        filecontent.close();
                    }
                }

                Cauhoi d = new Cauhoi();
                String content = request.getParameter("noidungcauhoi");
                String dapAnA = request.getParameter("A");
                String dapAnB = request.getParameter("B");
                String dapAnC = request.getParameter("C");
                //d.setRcId(Integer.parseInt(request.getParameter("hosoMa")));
                d.setCauhoiNoidung(content);
                d.setCauhoiDapana(dapAnA);
                d.setCauhoiDapanb(dapAnB);
                d.setCauhoiDapanc(dapAnC);
                d.setCauhoiAnh(imageName);
                d.setCauhoiDapan(request.getParameter("cauhoiDapan"));
                d.setCauhoiGiaithich(request.getParameter("cauhoiGiaithich"));
                d.setCauhoiThamkhao(request.getParameter("cauhoiThamkhao"));
                d.setCauhoiHangthi(request.getParameter("cauhoiHangthi"));
                dm.them(d);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " thêm câu hỏi số " + d.getCauhoiMa());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachcauhoi" + request.getParameter("cauhoiHangthi") + ".jsp";
            } else if (action.equals("sua")) {
                Cauhoi d = new Cauhoi();
                d.setCauhoiMa(Integer.parseInt(request.getParameter("cauhoiMa")));
                d.setCauhoiAnh(request.getParameter("cauhoiAnh"));
                d.setCauhoiDapan(request.getParameter("cauhoiDapan"));
                d.setCauhoiGiaithich(request.getParameter("cauhoiGiaithich"));
                d.setCauhoiThamkhao(request.getParameter("cauhoiThamkhao"));
                d.setCauhoiHangthi(request.getParameter("cauhoiHangthi"));
                dm.sua(d);
                Thongbao t = new Thongbao();
                t.setThongbaoNoidung(u.getNguoidungTen() + " sửa câu hỏi số " + d.getCauhoiMa());
                t.setThongbaoThoigian(LocalDateTime.now().toString());
                tm.them(t);
                page = "danhsachcauhoi" + request.getParameter("cauhoiHangthi") + ".jsp";
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
