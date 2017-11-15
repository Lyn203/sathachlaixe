<%-- 
    Document   : themcauhoi
    Created on : Apr 30, 2017, 10:34:04 AM
    Author     : SONVU
--%>

<%@page import="entities.Tailieu"%>
<%@page import="model.TailieuModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Thêm câu hỏi</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="add-new-wrap">
                        <h3 class="form-title">Thông tin đối tượng</h3>
                        <form method="post" action="CauhoiServlet?action=them" enctype="multipart/form-data">
                            <table class="add-new-table">
                                <tr>
                                    <td>Mã câu hỏi</td>
                                    <td>
                                        <input class="txt-form" type="text" name="cauhoiMa" disabled="disabled" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Thêm ảnh Nếu có</td>
                                    <td>
                                        <input class="txt-form" type="file" name="cauhoiAnh" />
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>Nội dung câu hỏi</td>
                                    <td>
                                        <input class="txt-form" type="text" name="noidungcauhoi" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Đáp án A (1)</td>
                                    <td>
                                        <input class="txt-form" type="text" name="A" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Đáp án B (2)</td>
                                    <td>
                                        <input class="txt-form" type="text" name="B" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td>Đáp án C (3)</td>
                                    <td>
                                        <input class="txt-form" type="text" name="C" />
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>Đáp án đúng (1,2 hoặc 3)</td>
                                    <td>
                                        <input class="txt-form" type="text" name="cauhoiDapan" value="" placeholder="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Giải thích</td>
                                    <td>
                                        <input class="txt-form" type="text" name="cauhoiGiaithich" value="" placeholder="" />
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
