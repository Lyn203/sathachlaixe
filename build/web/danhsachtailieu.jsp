<%-- 
    Document   : danhsachtailieu
    Created on : Apr 29, 2017, 1:32:14 PM
    Author     : SONVU
--%>

<%@page import="entities.Dmtl"%>
<%@page import="model.DmtlModel"%>
<%@page import="entities.Tailieu"%>
<%@page import="model.TailieuModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Danh sách tài liệu</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="list-wrap">
                        <div style="width: 300px; float: left">
                            <img src="image/add-circle-blue-128.png" width="15px" height="15px" style="padding-left: 5px"/>
                            <a href="themtailieu.jsp" style="font-size: 20px">Thêm Tài Liệu</a>

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
                                        <th>Mã tài liệu</th>
                                        <th>Tên tài liệu</th>
                                        <th>Danh mục</th>
                                        <th>Tóm tắt</th>
                                        <th colspan="2">Tùy chọn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                    TailieuModel rm = new TailieuModel();
                                    DmtlModel dm = new DmtlModel();
                                    for (int i = rm.danhsach().size() - 1; i > -1; i--) {
                                        Dmtl d = dm.thongtin(Integer.parseInt(rm.danhsach().get(i).getTailieuDanhmuc()));%>
                                <tr>
                                    <td class="cell-center"><%= rm.danhsach().get(i).getTailieuMa()%></td>
                                    <td class="cell-center"><%= rm.danhsach().get(i).getTailieuTen()%></td>
                                    <td class="cell-center"><%= d.getDmtlTen() %></td>
                                    <td class="cell-center"><%= rm.danhsach().get(i).getTailieuTomtat()%></td>
                                    <td class="edit-cell"><a href="suatailieu.jsp?action=sua&tailieuMa=<%= rm.danhsach().get(i).getTailieuMa()%>">Sửa</a></td>
                                    <td class="delete-cell"><a href="TailieuServlet?tailieuMa=<%= rm.danhsach().get(i).getTailieuMa()%>&action=xoa" onclick="return confirm('Bạn muốn xóa?')">Xóa</a></td>
                                </tr>
                                <!--/c:forEach-->
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
