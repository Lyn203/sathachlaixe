<%-- 
    Document   : danhsachcauhoi
    Created on : Apr 30, 2017, 10:23:20 AM
    Author     : SONVU
--%>

<%@page import="entities.Cauhoi"%>
<%@page import="model.CauhoiModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Danh sách câu hỏi hạng A2</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="list-wrap">
                        <div style="width: 300px; float: left">
                            <img src="image/add-circle-blue-128.png" width="15px" height="15px" style="padding-left: 5px"/>
                            <a href="themcauhoi.jsp" style="font-size: 20px">Thêm Câu Hỏi</a>

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
                                        <th>Mã câu hỏi</th>
                                        <th>Ảnh</th>
                                        <th>Đáp án</th>
                                        <th>Hạng thi</th>
                                        <th colspan="2">Tùy chọn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%CauhoiModel rm = new CauhoiModel();%>
                                <%for (Cauhoi r : rm.cauHoiTheoHangThi("A2")) {%>
                                <tr>
                                    <td class="cell-center"><%= r.getCauhoiMa()%></td>
                                    <td class="cell-center"><%= r.getCauhoiAnh()%></td>
                                    <td class="cell-center"><%= r.getCauhoiDapan()%></td>
                                    <td class="cell-center"><%= r.getCauhoiHangthi()%></td>
                                    <td class="edit-cell"><a href="suacauhoi.jsp?action=sua&cauhoiMa=<%= r.getCauhoiMa()%>">Sửa</a></td>
                                    <td class="delete-cell"><a href="CauhoiServlet?cauhoiMa=<%= r.getCauhoiMa()%>&action=xoa" onclick="return confirm('Bạn muốn xóa?')">Xóa</a></td>
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

