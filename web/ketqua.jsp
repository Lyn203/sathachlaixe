<%-- 
    Document   : index
    Created on : Apr 30, 2017, 10:55:02 AM
    Author     : SONVU
--%>

<%@page import="model.ThuchanhModel"%>
<%@page import="entities.Thuchanh"%>
<%@page import="model.HosoModel"%>
<%@page import="entities.Hoso"%>
<%@page import="java.util.List"%>
<%@page import="entities.Lythuyet"%>
<%@page import="model.LythuyetModel"%>
<%@page import="entities.Nguoidung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="indexheader.jsp"></jsp:include>
<%
    HosoModel hm = new HosoModel();
    Hoso u = hm.thongtin(Integer.parseInt(request.getParameter("hosoMa")));
%>
<div class="content">
    <div class="main-content">
        <div class="add-new-wrap">
            <h3 class="form-title">Hồ sơ đăng ký thi thực hành sát hạch lái xe</h3>
            <form name="myForm" method="post" action="HosoServlet?action=them">
                <table class="add-new-table">
                    <tr class="list-lt">
                        <td>Mã hồ sơ: </td>
                        <td><%= u.getHosoMa()%></td>
                        <td>Tên thí sinh: </td>
                        <td><%= u.getHosoTen()%></td>
                    </tr>
                    <tr class="list-lt">
                        <td>Số CMND: </td>
                        <td><%= u.getHosoCmnd()%></td>
                        <td>Hạng thi: </td>
                        <td><%= u.getHosoHangthi()%></td>
                    </tr>
                    <tr class="list-lt">
                        <td>Số điện thoại: </td>
                        <td><%= u.getHosoSdt()%></td>
                        <td>Email: </td>
                        <td><%= u.getHosoEmail()%></td>
                    </tr>
                    <tr class="list-lt">
                        <td>Ngày thi: </td>
                        <td><%= u.getHosoNgaythi()%></td>
                        <td>Địa điểm thi: </td>
                        <%
                            ThuchanhModel tm = new ThuchanhModel();
                            Thuchanh t = tm.thongtin(Integer.parseInt(u.getHosoDiadiem()));
                        %>
                        <td><%= t.getThuchanhDiadiem()%> - <%= t.getThuchanhTinhtp()%></td>
                    </tr>
                </table>
            </form>
        </div><!--end .list-wrap-->

    </div><!--end .main-content-->
</div>

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
