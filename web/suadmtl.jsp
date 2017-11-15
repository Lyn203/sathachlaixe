<%-- 
    Document   : suatailieu
    Created on : Apr 29, 2017, 1:36:11 PM
    Author     : SONVU
--%>

<%@page import="entities.Dmtl"%>
<%@page import="model.DmtlModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Cập nhật danh mục tài liệu</h2>
        <%
            String action = request.getParameter("action");
            DmtlModel rm = new DmtlModel();

            if (action.equals("sua")) {
                Dmtl r = rm.thongtin(Integer.parseInt(request.getParameter("dmtlMa")));
        %>
        <div class="main-content-wrap">
            <div class="main-content">
                <div class="add-new-wrap">
                    <h3 class="form-title">Thông tin đối tượng</h3>
                    <form method="post" action="DmtlServlet?action=sua&dmtlMa=<%= r.getDmtlMa()%>">
                        <table class="add-new-table">
                            <tr>
                                <td>Mã danh mục</td>
                                <td>
                                    <input class="txt-form" type="text" name="tailieuMa" value="<%= r.getDmtlMa()%>" disabled="disabled" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Tên danh mục</td>
                                <td>
                                    <input class="txt-form" type="text" name="dmtlTen" value="<%= r.getDmtlTen()%>" placeholder=""/>
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
