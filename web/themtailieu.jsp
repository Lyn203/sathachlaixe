<%-- 
    Document   : themtailieu
    Created on : Apr 29, 2017, 11:52:58 AM
    Author     : SONVU
--%>

<%@page import="entities.Dmtl"%>
<%@page import="entities.Tailieu"%>
<%@page import="model.DmtlModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Thêm tài liệu</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="add-new-wrap">
                        <h3 class="form-title">Thông tin đối tượng</h3>
                        <form method="post" action="TailieuServlet?action=them" enctype="multipart/form-data">
                            <table class="add-new-table">
                                <tr>
                                    <td>Mã tài liệu</td>
                                    <td>
                                        <input class="txt-form" type="text" name="tailieuMa" disabled="disabled" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tên tài liệu</td>
                                    <td>
                                        <input class="txt-form" type="text" name="tailieuTen" value="" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tóm tắt</td>
                                    <td>
                                        <input class="txt-form" type="text" name="tailieuTomtat" value="" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Nội dung chính</td>
                                    <td>
                                        <textarea class="txtarea-form" name="tailieuNoidung" placeholder="" id="detail"></textarea>
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
                                <tr>
                                    <td>Tập tin</td>
                                    <td>
                                        <input class="txt-form" type="file" name="tailieuTaptin" />
                                    </td>
                                </tr>
                                <tr>
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
