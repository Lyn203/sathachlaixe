<%-- 
    Document   : danhsachhoso
    Created on : Apr 28, 2017, 12:47:31 AM
    Author     : SONVU
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="entities.Thongbao"%>
<%@page import="model.ThongbaoModel"%>
<%@page import="model.TailieuModel"%>
<%@page import="model.LythuyetModel"%>
<%@page import="model.HosoModel"%>
<%@page import="model.NguoidungModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/31.ID-Horizontal-64.png"></div>
            <h2 class="admin-title">Tổng quan</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="add-new-wrap">
                        <h3 class="form-title">Thống kê</h3>
                        <table class="info-table">
                        <%
                            HosoModel hm = new HosoModel();
                            LythuyetModel lm = new LythuyetModel();
                            NguoidungModel nm = new NguoidungModel();
                            TailieuModel tm = new TailieuModel();
                        %>
                        <tr>
                            <td>Số lượng hồ sơ</td>
                            <td><%= hm.danhsach().size()%></td>
                            <td>Số lượng bài thi</td>
                            <td><%= lm.danhsach().size()%></td>
                        </tr>
                        <tr>
                            <td>Số lượng người dùng</td>
                            <td><%= nm.danhsach().size()%></td>
                            <td>Số lượng tài liệu</td>
                            <td><%= tm.danhsach().size()%></td>
                        </tr>
                    </table>
                    <h3 class="form-title">Thông báo</h3>
                    <div id="load-content"><img src="image/loading.gif" id="loading" alt="loading" /></div>
                    <div id="content"></div>
                </div><!--end .list-wrap-->
            </div><!--end .main-content-->
        </div><!--end .main-content-wrap-->
    </div><!--end #admin-content-->
</div><!--end #container-->

<jsp:include flush="true" page="quantrifooter.jsp"></jsp:include>
