<%-- 
    Document   : dangky
    Created on : May 3, 2017, 4:13:42 PM
    Author     : SONVU
--%>

<%@page import="model.NguoidungModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
        <script src="js/jquery-2.0.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/dangky.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dangky.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <p>Bạn đã có tài khoản?</p>
                <a href="dangnhap.jsp">Đăng nhập</a>
            </div>
            <div class="row">
                <form action="NguoidungServlet?action=dangky" method="POST" <!--onsubmit="return validate()-->">
                    <div class="form-group">
                        <label for="">Tên tài khoản <span id="result"></span></label>
                        <input type="text" class="form-control" name="nguoidungTaikhoan" id="acc" required onkeyup="checkuser()">
                        <label for="">Mật khẩu</label>
                        <input type="password" class="form-control" name="nguoidungMatkhau" id="pas" required>
                        <label for="">Nhập lại mật khẩu <span id="result2"></span></label>
                        <input type="password" class="form-control" name="" id="repas" required onkeyup="checkpas()">
                        <label for="">Họ và tên</label>
                        <input type="text" class="form-control" name="nguoidungTen" placeholder="Nhập đúng tên khai sinh" required>
                        <label for="">Ngày sinh</label>
                        <input type="text" class="form-control" name="nguoidungNgaysinh" placeholder="XX/YY/ZZZZ" pattern="\d{1,2}/\d{1,2}/\d{4}" required>
                        <label for="">Địa chỉ</label>
                        <input type="text" class="form-control" name="nguoidungDiachi" required>
                        <label for="">Số CMND</label>
                        <input type="text" class="form-control" name="nguoidungCmnd" required>
                        <label for="">Giới tính</label>
                        <input type="text" class="form-control" name="nguoidungGioitinh" required>
                        <label for="">Số điện thoại</label>
                        <input type="text" class="form-control" name="nguoidungSdt" required>
                        <label for="">Email</label>
                        <input type="email" class="form-control" name="nguoidungEmail" required>
                    </div>
                    <div class="res"><input type="submit" class="btn btn-primary" value="Đăng ký"></div>
                </form>
            </div>
        </div>
    </body>
</html>
