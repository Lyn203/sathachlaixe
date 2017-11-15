<%-- 
    Document   : index
    Created on : Apr 30, 2017, 10:55:02 AM
    Author     : SONVU
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Lythuyet"%>
<%@page import="model.LythuyetModel"%>
<%@page import="entities.Nguoidung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="indexheader.jsp"></jsp:include>
<%
    HttpSession ses = request.getSession();
    if (ses != null) {
        Nguoidung u = (Nguoidung) ses.getAttribute("Member");
        if (u == null) {
            out.print("<script>location.href='dangnhap.jsp';</script>");
        } else {
%>
<div class="content">
    <div class="main-content">
        <div class="add-new-wrap">
            <h3 class="form-title">Tổng hợp các bài thi lý thuyết đã thực hiện</h3>
            <form name="myForm" method="post" action="HosoServlet?action=them">
                <table class="add-new-table">
                    <tr class="list-lt">
                        <td>Tên người dùng: </td><td><%= u.getNguoidungTen()%></td>
                        <td>CMND: </td><td><%= u.getNguoidungCmnd()%></td>
                    </tr>
                    <%
                        LythuyetModel lm = new LythuyetModel();
                        List<Lythuyet> list = lm.lyThuyetTheoCmnd(u.getNguoidungCmnd());
                        for (Lythuyet l : list) {
                    %>
                    <tr class="list-lt">
                        <td>Mã bài thi: <%= l.getLythuyetMa()%></td>
                        <td>Đáp án: <%= l.getLythuyetDapan()%></td>
                        <td>Kết quả: <%= l.getLythuyetKetqua()%></td>
                        <td>Ngày thi: <%= l.getLythuyetNgaythi()%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </form>
        </div><!--end .list-wrap-->

    </div><!--end .main-content-->
</div>
<%
        }
    }
%>
<div class="Danhmucthi">
    <div class="cot">
        <a href="#">
            <img src="image/dk1a.jpg" class="anhkhoahoc" alt="Image">
        </a>  
    </div>
    <div class="cot">
        <a href="#">
            <img src="image/dk2a.jpg" class="anhkhoahoc" alt="Image" >
        </a> 
    </div>
    <div class="cot">
        <a href="#">
            <img src="image/dk5a.jpg" class="anhkhoahoc" alt="Image">

        </a>  
    </div>
    <div class="cot">
        <a href="#">
            <img src="image/dk3a.jpg" class="anhkhoahoc" alt="Image">
        </a>  
    </div>
    <div class="cot">
        <a href="#">
            <img src="image/dk4a.jpg" class="anhkhoahoc" alt="Image">
        </a>  
    </div>
    <div class="cot">
        <a href="#">
            <img src="image/dk10.jpg" class="anhkhoahoc" alt="Image">
        </a>  
    </div>
</div>

<jsp:include flush="true" page="indexfooter.jsp"></jsp:include>              
