<%-- 
    Document   : suacauhoi
    Created on : Apr 30, 2017, 10:36:50 AM
    Author     : SONVU
--%>

<%@page import="model.NguoidungModel"%>
<%@page import="entities.Nguoidung"%>
<%@page import="model.BannerModel"%>
<%@page import="entities.Banner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Cập nhật banner</h2>
        <%
            String action = request.getParameter("action");
            NguoidungModel rm = new NguoidungModel();

            if (action.equals("sua")) {
                Nguoidung r = rm.thongtin(Integer.parseInt(request.getParameter("nguoidungMa")));


        %>
        <div class="main-content-wrap">
            <div class="main-content">
                <div class="add-new-wrap">
                    <h3 class="form-title">Thông tin đối tượng</h3>
                    <form method="post" action="NguoidungServlet?action=sua&nguoidungMa=<%= r.getNguoidungMa()%>">
                        <table class="add-new-table">
                            <tr>
                                <td>Mã người dùng</td>
                                <td>
                                    <input class="txt-form" type="text" name="nguoidungMa" value="<%= r.getNguoidungMa()%>" disabled="disabled" placeholder=""/>
                                </td>
                                <td>Tên người dùng</td>
                                <td>
                                    <input class="txt-form" type="text" name="nguoidungTen" value="<%= r.getNguoidungTen()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Ngày sinh</td>
                                <td>
                                    <input class="txt-form" type="text" name="nguoidungNgaysinh" value="<%= r.getNguoidungNgaysinh()%>" placeholder="XX/YY/ZZZZ"/>
                                </td>
                                <td>Địa chỉ</td>
                                <td>
                                    <input class="txt-form" type="text" name="nguoidungDiachi" value="<%= r.getNguoidungDiachi()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Số CMND</td>
                                <td>
                                    <input class="txt-form" type="text" name="nguoidungCmnd" value="<%= r.getNguoidungCmnd()%>" placeholder=""/>
                                </td>
                                <td>Giới tính</td>
                                <td>
                                    <input class="txt-form" type="text" name="nguoidungGioitinh" value="<%= r.getNguoidungGioitinh()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>SDT</td>
                                <td>
                                    <input class="txt-form" type="text" name="nguoidungSdt" value="<%= r.getNguoidungSdt()%>" placeholder=""/>
                                </td>
                                <td>Email</td>
                                <td>
                                    <input class="txt-form" type="text" name="nguoidungEmail" value="<%= r.getNguoidungEmail()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Tài khoản</td>
                                <td>
                                    <input class="txt-form" type="text" name="nguoidungTaikhoan" value="<%= r.getNguoidungTaikhoan()%>" placeholder=""/>
                                </td>
                                <td>Mật khẩu</td>
                                <td>
                                    <input class="txt-form" type="text" name="nguoidungMatkhau" value="<%= r.getNguoidungMatkhau()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Quyền</td>
                                <td>
                                    <label><input type="radio" name="nguoidungQuyen" value="admin"/> Quản trị</label>
                                    <label><input type="radio" name="nguoidungQuyen" value="member"/> Thành viên</label>
                                </td>
                                <td></td>
                                <td>
                                    <input class="btn-form" type="submit" name="submit" value="Cập nhật"/>
                                </td>
                            </tr>
                            <script type="text/javascript">
                                $("input[value='<%= r.getNguoidungQuyen()%>']").attr('checked', true);
                            </script>
                        </table>
                    </form>
                </div><!--end .list-wrap-->

            </div><!--end .main-content-->
        </div><!--end .main-content-wrap-->
        <% }%>
    </div><!--end #admin-content-->
</div><!--end #container-->

<jsp:include flush="true" page="quantrifooter.jsp"></jsp:include>
