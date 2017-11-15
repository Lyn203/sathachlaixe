<%-- 
    Document   : danhsachhoso
    Created on : Apr 28, 2017, 12:47:31 AM
    Author     : SONVU
--%>

<%@page import="entities.Thuchanh"%>
<%@page import="model.ThuchanhModel"%>
<%@page import="entities.Hoso"%>
<%@page import="model.HosoModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/31.ID-Horizontal-64.png"></div>
            <h2 class="admin-title">Danh sách hồ sơ</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="list-wrap">
                        <div style="width: 300px; float: left">
<!--                            <img src="image/add-circle-blue-128.png" width="15px" height="15px" style="padding-left: 5px"/>
                            <a href="themhoso.jsp" style="font-size: 20px">Thêm Hồ Sơ</a>-->
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
                                        <th>Mã hồ sơ</th>
                                        <th>Tên thí sinh</th>
                                        <th>Số CMND</th>
                                        <th>Hạng thi</th>
                                        <th>Ngày thi</th>
                                        <th>Địa điểm</th>
                                        <th colspan="2">Tùy chọn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%HosoModel rm = new HosoModel();%>
                                <%for (int i = rm.danhsach().size() - 1; i > -1; i--) {%>
                                <tr>
                                    <td class="cell-center"><%= rm.danhsach().get(i).getHosoMa()%></td>
                                    <td class="cell-center"><%= rm.danhsach().get(i).getHosoTen()%></td>
                                    <td class="cell-center"><%= rm.danhsach().get(i).getHosoCmnd()%></td>
                                    <td class="cell-center"><%= rm.danhsach().get(i).getHosoHangthi()%></td>
                                    <td class="cell-center"><%= rm.danhsach().get(i).getHosoNgaythi()%></td>
                                    <%
                                        ThuchanhModel tm = new ThuchanhModel();
                                        Thuchanh t = tm.thongtin(Integer.parseInt(rm.danhsach().get(i).getHosoDiadiem()));
                                    %>
                                    <td class="cell-center"><%= t.getThuchanhDiadiem()%> - <%= t.getThuchanhTinhtp()%></td>
                                    <td class="edit-cell"><a href="suahoso.jsp?action=sua&hosoMa=<%= rm.danhsach().get(i).getHosoMa()%>">Sửa</a></td>
                                    <td class="delete-cell"><a href="HosoServlet?hosoMa=<%= rm.danhsach().get(i).getHosoMa()%>&action=xoa" onclick="return confirm('Bạn muốn xóa?')">Xóa</a></td>
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
