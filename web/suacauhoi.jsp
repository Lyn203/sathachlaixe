<%-- 
    Document   : suacauhoi
    Created on : Apr 30, 2017, 10:36:50 AM
    Author     : SONVU
--%>

<%@page import="entities.Tailieu"%>
<%@page import="model.TailieuModel"%>
<%@page import="entities.Cauhoi"%>
<%@page import="model.CauhoiModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Cập nhật câu hỏi</h2>
        <%
            String action = request.getParameter("action");
            CauhoiModel rm = new CauhoiModel();

            if (action.equals("sua")) {
                Cauhoi r = rm.thongtin(Integer.parseInt(request.getParameter("cauhoiMa")));


        %>
        <div class="main-content-wrap">
            <div class="main-content">
                <div class="add-new-wrap">
                    <h3 class="form-title">Thông tin đối tượng</h3>
                    <form method="post" action="CauhoiServlet?action=sua&cauhoiMa=<%= r.getCauhoiMa()%>">
                        <table class="add-new-table">
                            <tr>
                                <td>Mã câu hỏi</td>
                                <td>
                                    <input class="txt-form" type="text" name="cauhoiMa" value="<%= r.getCauhoiMa()%>" disabled="disabled" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Thay đổi Ảnh</td>
                                <td>
                                    <input class="txt-form" type="text" name="cauhoiAnh" value="<%= r.getCauhoiAnh()%>" placeholder=""/>
                                </td>
                            </tr>
                             <tr>
                                <td>Đáp án A</td>
                                <td>
                                    <input class="txt-form" type="text" name="cahoiDapanA" value="<%= r.getCauhoiDapAnA()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Đáp án</td>
                                <td>
                                    <input class="txt-form" type="text" name="cauhoiDapan" value="<%= r.getCauhoiDapan()%>" placeholder="" />
                                </td>
                            </tr>
                            <tr>
                                <td>Giải thích</td>
                                <td>
                                    <input class="txt-form" type="text" name="cauhoiGiaithich" value="<%= r.getCauhoiGiaithich()%>" placeholder="" />
                                </td>
                            </tr>
                            <tr>
                                <td>Tham khảo</td>
                                <td>
                                    <select class="cbb-form" name="cauhoiThamkhao">
                                        <option value=""></option>
                                        <% TailieuModel tm = new TailieuModel(); %>
                                        <% for (Tailieu t : tm.danhsach()) {%>
                                        <option value="<%= t.getTailieuMa()%>"><%= t.getTailieuTen()%></option>
                                        <% }%>
                                    </select>
                                </td>
                            </tr>
                            <script type="text/javascript">
                                $("option[value='<%= r.getCauhoiThamkhao()%>']").attr('selected', true);
                            </script>
                            <tr>
                                <td>Hạng thi</td>
                                <td>
                                    <label><input type="radio" name="cauhoiHangthi" value="A1"/> A1</label>
                                    <label><input type="radio" name="cauhoiHangthi" value="A2"/> A2</label>
                                    <label><input type="radio" name="cauhoiHangthi" value="A3"/> A3</label>
                                    <label><input type="radio" name="cauhoiHangthi" value="A4"/> A4</label>
                                    <label><input type="radio" name="cauhoiHangthi" value="B1"/> B1</label>
                                    <label><input type="radio" name="cauhoiHangthi" value="B2"/> B2</label>
                                    <label><input type="radio" name="cauhoiHangthi" value="B3"/> B3</label>
                                </td>
                            </tr>     
                            <script type="text/javascript">
                                $("input[value='<%= r.getCauhoiHangthi()%>']").attr('checked', true);
                            </script>
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
