<%-- 
    Document   : suatailieu
    Created on : Apr 29, 2017, 1:36:11 PM
    Author     : SONVU
--%>

<%@page import="model.ThuchanhModel"%>
<%@page import="entities.Thuchanh"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Cập nhật lịch thi thực hành</h2>
        <%
            String action = request.getParameter("action");
            ThuchanhModel rm = new ThuchanhModel();

            if (action.equals("sua")) {
                Thuchanh r = rm.thongtin(Integer.parseInt(request.getParameter("thuchanhMa")));
        %>
        <div class="main-content-wrap">
            <div class="main-content">
                <div class="add-new-wrap">
                    <h3 class="form-title">Thông tin đối tượng</h3>
                    <form method="post" action="ThuchanhServlet?action=sua&thuchanhMa=<%= r.getThuchanhMa()%>">
                        <table class="add-new-table">
                            <tr>
                                <td>Mã lịch thi</td>
                                <td>
                                    <input class="txt-form" type="text" name="thuchanhMa" value="<%= r.getThuchanhMa()%>" disabled="disabled" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Ngày thi</td>
                                <td>
                                    <input class="txt-form" type="text" name="thuchanhNgay" value="<%= r.getThuchanhNgay()%>" placeholder=""/>
                                </td>
                            </tr>   
                            <tr>
                                <td>Địa điểm thi</td>
                                <td>
                                    <input class="txt-form" type="text" name="thuchanhDiadiem" value="<%= r.getThuchanhDiadiem()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Tỉnh/Thành phố</td>
                                <td>
                                    <input class="txt-form" type="text" name="thuchanhTinhtp" value="<%= r.getThuchanhTinhtp()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input class="btn-form" type="submit" name="submit" value="Cập nhật"/>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div><!--end .list-wrap-->

            </div><!--end .main-content-->
        </div><!--end .main-content-wrap-->
        <% }%>
    </div><!--end #admin-content-->
</div><!--end #container-->

<jsp:include flush="true" page="quantrifooter.jsp"></jsp:include>
