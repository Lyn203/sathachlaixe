<%-- 
    Document   : danhsachhoso
    Created on : Apr 28, 2017, 12:47:31 AM
    Author     : SONVU
--%>

<%@page import="entities.Nguoidung"%>
<%@page import="model.NguoidungModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/31.ID-Horizontal-64.png"></div>
            <h2 class="admin-title">Trang quản trị</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="add-new-wrap">
                        <h3 class="form-title">Thông tin người dùng</h3>
                        <form>
                            <table class="add-new-table">
                            <%
                                HttpSession ses = request.getSession();
                                if (ses != null) {
                                    Nguoidung u = (Nguoidung) ses.getAttribute("User");
                            %>
                            <tr>
                                <td>Họ tên</td>
                                <td><%= u.getNguoidungTen()%></td>
                                <td>Ngày sinh</td>
                                <td><%= u.getNguoidungNgaysinh()%></td>
                            </tr>
                            <tr>
                                <td>Địa chỉ</td>
                                <td><%= u.getNguoidungDiachi()%></td>
                                <td>Số CMND</td>
                                <td><%= u.getNguoidungCmnd()%></td>
                            </tr>
                            <tr>
                                <td>Giới tính</td>
                                <td><%= u.getNguoidungGioitinh()%></td>
                                <td>Số điện thoại</td>
                                <td><%= u.getNguoidungSdt()%></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><%= u.getNguoidungEmail()%></td>
                                <td>Tài khoản</td>
                                <td><%= u.getNguoidungTaikhoan()%></td>
                            </tr>
                            <tr>
                                <td>Mật khẩu</td>
                                <td><%= u.getNguoidungMatkhau()%></td>
                                <td></td>
                                <td>
                                    <a href="suanguoidung.jsp?action=sua&nguoidungMa=<%= u.getNguoidungMa()%>">Cập nhật</a>
                                </td>
                            </tr>
                            <%}%>
                        </table>
                    </form>
                </div><!--end .list-wrap-->
            </div><!--end .main-content-->
        </div><!--end .main-content-wrap-->
    </div><!--end #admin-content-->
</div><!--end #container-->

<jsp:include flush="true" page="quantrifooter.jsp"></jsp:include>
