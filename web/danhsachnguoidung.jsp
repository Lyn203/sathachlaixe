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
            <h2 class="admin-title">Danh sách người dùng</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="list-wrap">
                        <div style="width: 300px; float: left">
                            <img src="image/add-circle-blue-128.png" width="15px" height="15px" style="padding-left: 5px"/>
                            <a href="themhoso.jsp" style="font-size: 20px">Thêm Người Dùng</a>
                        </div>
                        <div style="margin-left: 800px">
                            <div style="float: left">
                                <img src="image/698838-icon-111-search-32.png" width="20px" height="20px"/>
                            </div>
                            <div style="margin-top: 5px; margin-bottom: 5px">
                                <input type="text" id="searchBox" >
                            </div>
                        </div>
                        <form>
                            <table class="list-table">
                                <thead>
                                    <tr>
                                        <th>Mã người dùng</th>
                                        <th>Tên người dùng</th>
                                        <th>Ngày sinh</th>
                                        <th>Địa chỉ</th>
                                        <th>Số CMND</th>
                                        <th>Giới tính</th>
                                        <th>SDT</th>
                                        <th>Email</th>
                                        <th>Tài khoản</th>
                                        <th>Mật khẩu</th>
                                        <th>Quyền</th>
                                        <th colspan="2">Tùy chọn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%NguoidungModel rm = new NguoidungModel();%>
                                <%for (Nguoidung r : rm.danhsach()) {%>
                                <tr>
                                    <td class="cell-center"><%= r.getNguoidungMa()%></td>
                                    <td class="cell-center"><%= r.getNguoidungTen()%></td>
                                    <td class="cell-center"><%= r.getNguoidungNgaysinh()%></td>
                                    <td class="cell-center"><%= r.getNguoidungDiachi()%></td>
                                    <td class="cell-center"><%= r.getNguoidungCmnd()%></td>
                                    <td class="cell-center"><%= r.getNguoidungGioitinh()%></td>
                                    <td class="cell-center"><%= r.getNguoidungSdt()%></td>
                                    <td class="cell-center"><%= r.getNguoidungEmail()%></td>
                                    <td class="cell-center"><%= r.getNguoidungTaikhoan()%></td>
                                    <td class="cell-center"><%= r.getNguoidungMatkhau()%></td>
                                    <td class="cell-center"><%= r.getNguoidungQuyen()%></td>
                                    <td class="edit-cell"><a href="suanguoidung.jsp?action=sua&nguoidungMa=<%= r.getNguoidungMa()%>">Sửa</a></td>
                                    <td class="delete-cell"><a href="NguoidungServlet?nguoidungMa=<%= r.getNguoidungMa()%>&action=xoa" onclick="return confirm('Bạn muốn xóa?')">Xóa</a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <div class="pagination-div">
                            <ul class="pagination"></ul>
                        </div>
                    </form>
                </div><!--end .list-wrap-->
            </div><!--end .main-content-->
        </div><!--end .main-content-wrap-->
    </div><!--end #admin-content-->
</div><!--end #container-->

<jsp:include flush="true" page="quantrifooter.jsp"></jsp:include>
