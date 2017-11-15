<%-- 
    Document   : suatailieu
    Created on : Apr 29, 2017, 1:36:11 PM
    Author     : SONVU
--%>

<%@page import="model.DmtlModel"%>
<%@page import="entities.Dmtl"%>
<%@page import="entities.Tailieu"%>
<%@page import="model.TailieuModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Cập nhật tài liệu</h2>
        <%
            String action = request.getParameter("action");
            TailieuModel rm = new TailieuModel();

            if (action.equals("sua")) {
                Tailieu r = rm.thongtin(Integer.parseInt(request.getParameter("tailieuMa")));


        %>
        <div class="main-content-wrap">
            <div class="main-content">
                <div class="add-new-wrap">
                    <h3 class="form-title">Thông tin đối tượng</h3>
                    <form method="post" action="TailieuServlet?action=sua&tailieuMa=<%= r.getTailieuMa()%>">
                        <table class="add-new-table">
                            <tr>
                                <td>Mã tài liệu</td>
                                <td>
                                    <input class="txt-form" type="text" name="tailieuMa" value="<%= r.getTailieuMa()%>" disabled="disabled" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Tên tài liệu</td>
                                <td>
                                    <input class="txt-form" type="text" name="tailieuTen" value="<%= r.getTailieuTen()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Tóm tắt</td>
                                <td>
                                    <input class="txt-form" type="text" name="tailieuTomtat" value="<%= r.getTailieuTomtat() %>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Nội dung chính</td>
                                <td>
                                    <textarea class="txtarea-form" name="tailieuNoidung" placeholder="" id="detail"><%= r.getTailieuNoidung()%></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>Danh mục</td>
                                <td>
                                    <select class="cbb-form" name="tailieuDanhmuc">
                                        <option value=""></option>
                                        <% DmtlModel tm = new DmtlModel(); %>
                                        <% for (Dmtl t : tm.danhsach()) {%>
                                        <option value="<%= t.getDmtlMa()%>"><%= t.getDmtlTen()%></option>
                                        <% }%>
                                    </select>
                                </td>
                            </tr>
                            <script type="text/javascript">
                                $("option[value='<%= r.getTailieuDanhmuc()%>']").attr('selected', true);
                            </script>
                            <tr>
                                <td>Tập tin</td>
                                <td>
                                    <input class="txt-form" type="text" name="tailieuTaptin" value="<%= r.getTailieuTaptin()%>" placeholder=""/>
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
