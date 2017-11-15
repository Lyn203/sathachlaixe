<%-- 
    Document   : themhoso
    Created on : Apr 28, 2017, 1:02:53 AM
    Author     : SONVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/31.ID-Horizontal-64.png"></div>
            <h2 class="admin-title">Thêm người dùng</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="add-new-wrap">
                        <h3 class="form-title">Thông tin đối tượng</h3>
                        <form method="post" action="NguoidungServlet?action=them">
                            <table class="add-new-table">
                                <tr>
                                    <td>Mã người dùng</td>
                                    <td>
                                        <input class="txt-form" type="text" name="nguoidungMa" disabled="disabled" placeholder=""/>
                                    </td>
                                    <td>Tên người dùng</td>
                                    <td>
                                        <input class="txt-form" type="text" name="nguoidungTen" value="" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ngày sinh</td>
                                    <td>
                                        <input class="txt-form" type="text" name="nguoidungNgaysinh" value="" placeholder="XX/YY/ZZZZ"/>
                                    </td>
                                    <td>Địa chỉ</td>
                                    <td>
                                        <input class="txt-form" type="text" name="nguoidungDiachi" value="" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Số CMND</td>
                                    <td>
                                        <input class="txt-form" type="text" name="nguoidungCmnd" value="" placeholder=""/>
                                    </td>
                                    <td>Giới tính</td>
                                    <td>
                                        <input class="txt-form" type="text" name="nguoidungGioitinh" value="" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>SDT</td>
                                    <td>
                                        <input class="txt-form" type="text" name="nguoidungSdt" value="" placeholder=""/>
                                    </td>
                                    <td>Email</td>
                                    <td>
                                        <input class="txt-form" type="text" name="nguoidungEmail" value="" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tài khoản</td>
                                    <td>
                                        <input class="txt-form" type="text" name="nguoidungTaikhoan" value="" placeholder=""/>
                                    </td>
                                    <td>Mật khẩu</td>
                                    <td>
                                        <input class="txt-form" type="text" name="nguoidungMatkhau" value="" placeholder=""/>
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
                                        <input class="btn-form" type="submit" name="submit" value="Thêm"/>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div><!--end .list-wrap-->

                </div><!--end .main-content-->
            </div><!--end .main-content-wrap-->
        </div><!--end #admin-content-->
    </div><!--end #container-->

<jsp:include flush="true" page="quantrifooter.jsp"></jsp:include>
