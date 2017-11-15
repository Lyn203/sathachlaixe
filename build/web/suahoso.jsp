<%-- 
    Document   : suahoso
    Created on : Apr 28, 2017, 9:37:29 PM
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
            <h2 class="admin-title">Cập nhật hồ sơ</h2>
        <%
            String action = request.getParameter("action");
            HosoModel rm = new HosoModel();

            if (action.equals("sua")) {
                Hoso r = rm.thongtin(Integer.parseInt(request.getParameter("hosoMa")));


        %>
        <div class="main-content-wrap">
            <div class="main-content">
                <div class="add-new-wrap">
                    <h3 class="form-title">Thông tin đối tượng</h3>
                    <form method="post" action="HosoServlet?action=sua&hosoMa=<%= r.getHosoMa()%>">
                        <table class="add-new-table">
                            <tr>
                                <td>Mã hồ sơ</td>
                                <td>
                                    <input class="txt-form" type="text" name="hosoMa" value="<%= r.getHosoMa()%>" disabled="disabled" placeholder=""/>
                                </td>
                                <td>Tên thí sinh</td>
                                <td>
                                    <input class="txt-form" type="text" name="hosoTen" value="<%= r.getHosoTen()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Số CMND</td>
                                <td>
                                    <input class="txt-form" type="text" name="hosoCmnd" value="<%= r.getHosoCmnd()%>" placeholder=""/>
                                </td>
                                <td>SDT</td>
                                <td>
                                    <input class="txt-form" type="text" name="hosoSdt" value="<%= r.getHosoSdt()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>
                                    <input class="txt-form" type="text" name="hosoEmail" value="<%= r.getHosoEmail()%>" placeholder=""/>
                                </td>
                                <td>Hạng thi</td>
                                <td>
                                    <label><input type="radio" name="hosoHangthi" value="A1"/> A1</label>
                                    <label><input type="radio" name="hosoHangthi" value="A2"/> A2</label>
                                    <label><input type="radio" name="hosoHangthi" value="B1"/> B1</label>
                                    <label><input type="radio" name="hosoHangthi" value="B2"/> B2</label>
                                </td>
                            </tr>
                            <script type="text/javascript">
                                $("input[value='<%= r.getHosoHangthi()%>']").attr('checked', true);
                            </script>
                            <tr>
                                <td>Ngày lập</td>
                                <td>
                                    <input class="txt-form" type="text" name="hosoNgaylap" value="<%= r.getHosoNgaylap()%>" placeholder=""/>
                                </td>
                                <td>Ngày thi</td>
                                <td>
                                    <input class="txt-form" type="text" name="hosoNgaythi" value="<%= r.getHosoNgaythi()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Địa điểm thi</td>
                                <td>
                                    <select class="cbb-form" name="hosoDiadiem">
                                        <option value=""></option>
                                        <% ThuchanhModel tm = new ThuchanhModel(); %>
                                        <% for (Thuchanh t : tm.danhsach()) {%>
                                        <option value="<%= t.getThuchanhMa()%>"><%= t.getThuchanhDiadiem()%> - <%= t.getThuchanhTinhtp()%></option>
                                        <% }%>
                                    </select>
                                </td>
                                <td>Ảnh CMND</td>
                                <td>
                                    <input class="txt-form" type="text" name="hosoAnhcmnd" value="<%= r.getHosoAnhcmnd()%>" placeholder=""/>
                                </td>
                            </tr>
                            <script type="text/javascript">
                                $("option[value='<%= r.getHosoDiadiem()%>']").attr('selected', true);
                            </script>
                            <tr>
                                <td>Ảnh chân dung</td>
                                <td>
                                    <input class="txt-form" type="text" name="hosoAnhchandung" value="<%= r.getHosoAnhchandung()%>" placeholder=""/>
                                </td>
                                <td>Chứng nhận sức khỏe</td>
                                <td>
                                    <input class="txt-form" type="text" name="hosoSuckhoe" value="<%= r.getHosoSuckhoe()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
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

