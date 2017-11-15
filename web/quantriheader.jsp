<%-- 
    Document   : quantriheader
    Created on : Apr 29, 2017, 2:39:19 PM
    Author     : SONVU
--%>

<%@page import="entities.Nguoidung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản trị</title>
        <script type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
        <script type="text/javascript" src="js/admin.js"></script>
        <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
        <link href="css/admin-style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            HttpSession ses = request.getSession();
            if (ses != null) {
                Nguoidung u = (Nguoidung) ses.getAttribute("User");
                if (u == null) {
                    out.print("<script>location.href='dangnhap.jsp';</script>");
                }
            }
        %>
        <div id="header">
            <div id="logo">
                <a href="#">Quản trị sát hạch</a>
            </div>
            <div id="user-bar">
                <div id="user-option">
                    <a id="user-info" href="#">
                        <img src="image/user.jpg">
                        <span>Quản trị</span>
                    </a>
                    <ul>
                        <li><a href="quantri.jsp">Trang cá nhân</a></li>
                        <li><a href="#">Tạm khóa</a></li>
                        <li><a href="NguoidungServlet?action=dx" class="dx">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
        </div><!--end #header-->
