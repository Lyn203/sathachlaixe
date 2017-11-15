<%-- 
    Document   : index
    Created on : Apr 30, 2017, 10:55:02 AM
    Author     : SONVU
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Lythuyet"%>
<%@page import="model.LythuyetModel"%>
<%@page import="entities.Thuchanh"%>
<%@page import="model.ThuchanhModel"%>
<%@page import="entities.Nguoidung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="indexheader.jsp"></jsp:include>
<%
    HttpSession ses = request.getSession();
    if (ses != null) {
        Nguoidung u = (Nguoidung) ses.getAttribute("Member");
        if (u == null) {
            out.print("<script>location.href='dangnhap.jsp';</script>");
        } else {
%>
<div class="content">
    <div class="main-content">
        <div class="add-new-wrap">
            <%
                LythuyetModel lm = new LythuyetModel();
                List<Lythuyet> list = lm.lyThuyetTheoCmnd(u.getNguoidungCmnd());
                boolean flag = false;
                if (list.size() == 0) {
                    flag = true;
                }
                for (Lythuyet l : list) {
                    if (Integer.parseInt(l.getLythuyetKetqua().substring(0, l.getLythuyetKetqua().indexOf("/"))) > 16) {
                        flag = false;
                        break;
                    } else {
                        flag = true;
                    }
                }
                if (flag) {
            %>
            <h3 class="form-title">Bạn chưa hoàn thành bài thi sát hạch lý thuyết lái xe! <a href="daotaoa1.jsp">Bắt đầu bài thi</a></h3>
            <%
            } else {
            %>
            <h3 class="form-title">Nộp hồ sơ đăng ký thi lấy giấy phép lái xe</h3>
            <form name="myForm" method="post" action="HosoServlet?action=them" enctype="multipart/form-data">
                <table class="add-new-table">
                    <tr>
                        <td>Mã hồ sơ</td>
                        <td>
                            <input class="txt-form" type="text" name="hosoMa" disabled="disabled" placeholder=""/>
                        </td>
                        <td>Tên thí sinh</td>
                        <td>
                            <input class="txt-form" type="text" name="hosoTen" value="<%= u.getNguoidungTen()%>" placeholder="" required/>
                        </td>
                    </tr>
                    <tr>
                        <td>Ngày sinh</td>
                        <td>
                            <input class="txt-form" type="text" name="hosoNgaysinh" value="<%= u.getNguoidungNgaysinh()%>" placeholder="XX/YY/ZZZZ" pattern="\d{1,2}/\d{1,2}/\d{4}" required/>
                        </td>
                        <td>Địa chỉ</td>
                        <td>
                            <input class="txt-form" type="text" name="hosoDiachi" value="<%= u.getNguoidungDiachi()%>" placeholder="" required/>
                        </td>
                    </tr>
                    <tr>
                        <td>Số CMND</td>
                        <td>
                            <input class="txt-form" type="text" name="hosoCmnd" value="<%= u.getNguoidungCmnd()%>" placeholder="" required/>
                        </td>
                        <td>Hạng thi</td>
                        <td>
                            <label><input type="radio" name="hosoHangthi" value="A1"/> A1</label>
                            <label><input type="radio" name="hosoHangthi" value="A2"/> A2</label>
                            <label><input type="radio" name="hosoHangthi" value="B1"/> B1</label>
                        </td>
                    </tr>
                    <tr>
                        <td>Ngày thi thực hành</td>
                        <td>
                            <select class="cbb-form" name="hosoNgaythi">
                                <option value=""></option>
                                <% ThuchanhModel tm = new ThuchanhModel(); %>
                                <% for (Thuchanh t : tm.danhsach()) {%>
                                <option value="<%= t.getThuchanhNgay()%>"><%= t.getThuchanhNgay()%></option>
                                <% }%>
                            </select>
                        </td>
                        <td>Địa điểm</td>
                        <td>
                            <select class="cbb-form" name="hosoDiadiem">
                                <option value=""></option>
                                <% for (Thuchanh t : tm.danhsach()) {%>
                                <option value="<%= t.getThuchanhMa()%>"><%= t.getThuchanhDiadiem()%> - <%= t.getThuchanhTinhtp()%></option>
                                <% }%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Ảnh CMND</td>
                        <td>
                            <input class="txt-form" type="file" name="hosoAnhcmnd" />
                        </td>
                        <td>Ảnh chân dung</td>
                        <td>
                            <input class="txt-form" type="file" name="hosoAnhchandung" />
                        </td>
                    </tr>
                    <tr>
                        <td>Chứng nhận sức khỏe</td>
                        <td>
                            <input class="txt-form" type="file" name="hosoSuckhoe" />
                        </td>
                        <td></td>
                        <td>
                            <input class="btn-form" type="submit" name="submit" value="Nộp hồ sơ"/>
                        </td>
                    </tr>
                    <%}%>
                    <%}%>
                </table>
            </form>
            <% }%>
        </div><!--end .list-wrap-->

    </div><!--end .main-content-->
</div>
<div class="Danhmucthi">
    <div class="cot">
        <a href="#">
            <img src="image/dk1a.jpg" class="anhkhoahoc" alt="Image">
        </a>  
    </div>
    <div class="cot">
        <a href="#">
            <img src="image/dk2a.jpg" class="anhkhoahoc" alt="Image" >
        </a> 
    </div>
    <div class="cot">
        <a href="#">
            <img src="image/dk5a.jpg" class="anhkhoahoc" alt="Image">

        </a>  
    </div>
    <div class="cot">
        <a href="#">
            <img src="image/dk3a.jpg" class="anhkhoahoc" alt="Image">
        </a>  
    </div>
    <div class="cot">
        <a href="#">
            <img src="image/dk4a.jpg" class="anhkhoahoc" alt="Image">
        </a>  
    </div>
    <div class="cot">
        <a href="#">
            <img src="image/dk10.jpg" class="anhkhoahoc" alt="Image">
        </a>  
    </div>
</div>

<jsp:include flush="true" page="indexfooter.jsp"></jsp:include>              
