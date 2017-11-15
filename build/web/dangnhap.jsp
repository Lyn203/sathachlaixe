<%-- 
    Document   : dangnhap
    Created on : May 3, 2017, 2:33:55 PM
    Author     : SONVU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <script src="js/jquery-2.1.4.js"></script>
        <script src="js/jquery-2.0.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/dangnhap.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dangnhap.css">
    </head>
    <body>
        <div class="main">
            <div class="signin">
                <div id="result">
                    <%
                        String noti = request.getParameter("noti");
                        if (noti != null) {
                            if (noti.equals("error")) {
                    %>
                    Đăng nhập không thành công
                    <% } else if (noti.equals("success")) {%>
                    <div>Đăng ký thành công</div>
                    <%
                            }
                        }
                    %>
                </div>
                <form action="NguoidungServlet?action=dangnhap" method="POST">
                    <div class="form-group">
                        <input id="acc" type="text" class="form-control" name="nguoidungTaikhoan" placeholder="Tên tài khoản" autofocus>
                        <input id="pas" type="password" class="form-control" name="nguoidungMatkhau" placeholder="Mật khẩu">
                    </div>
                    <a href="#">Quên mật khẩu?</a>
                    <div>
                        <input type="submit" class="btn btn-primary pull-right" value="Đăng nhập" id="btnlogin">
                        <!--<input type="button" class="btn btn-primary pull-right" value="Đăng nhập" onclick="signin()">-->
                    </div>
                </form>
            </div>
            <div style="float:left;padding:80px 40px">
                <p>Chưa có tài khoản</p>
                <!--		<button type="button" class="btn btn-danger">Đăng ký</button>-->
                <a href="dangky.jsp" class="btn btn-danger">Đăng ký</a>
            </div>
        </div>
    </body>
</html>
