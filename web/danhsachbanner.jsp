<%-- 
    Document   : danhsachcauhoi
    Created on : Apr 30, 2017, 10:23:20 AM
    Author     : SONVU
--%>

<%@page import="entities.Banner"%>
<%@page import="model.BannerModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Danh sách banner</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="list-wrap">
                        <div style="width: 300px; float: left">
                            <img src="image/add-circle-blue-128.png" width="15px" height="15px" style="padding-left: 5px"/>
                            <a href="thembanner.jsp" style="font-size: 20px">Thêm Banner</a>

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
                                        <th>Mã banner</th>
                                        <th>Tên banner</th>
                                        <th>Ảnh</th>
                                        <th>Đang sử dụng</th>
                                        <th colspan="2">Tùy chọn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%BannerModel rm = new BannerModel();%>
                                <%for (Banner r : rm.danhsach()) {%>
                                <tr>
                                    <td class="cell-center"><%= r.getBannerMa()%></td>
                                    <td class="cell-center"><%= r.getBannerTen()%></td>
                                    <td class="cell-center"><%= r.getBannerAnh()%></td>
                                    <td class="cell-center">
                                        <% if (r.getBannerTinhtrang().equals("1")) {%>
                                        <img src="image/Check_mark_icon-64.png" width="20px" height="20px"/>
                                        <% } %>
                                    </td>
                                    <td class="edit-cell"><a href="suabanner.jsp?action=sua&bannerMa=<%= r.getBannerMa()%>">Sửa</a></td>
                                    <td class="delete-cell"><a href="BannerServlet?bannerMa=<%= r.getBannerMa()%>&action=xoa" onclick="return confirm('Bạn muốn xóa?')">Xóa</a></td>
                                </tr>
                                <!--/c:forEach-->
                                <% } %>
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

