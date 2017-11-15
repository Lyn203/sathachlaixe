<%-- 
    Document   : indexheader
    Created on : Apr 30, 2017, 10:57:01 AM
    Author     : SONVU
--%>

<%@page import="entities.Dmtl"%>
<%@page import="model.DmtlModel"%>
<%@page import="entities.Nguoidung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trung tâm đào tạo và sát hạch lái xe</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
        <script src="js/jquery-3.1.1.js"></script>
        <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <script src="js/bootstrap-3.3.7.js"></script>
        <script src="js/daotao.js"></script>
        <link rel="stylesheet" type="text/css" href="css/home.css">
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.7.css">
    </head>
    <body class="background">
        <div id="chinh">
            <div id="them">
                <div class="header">
                    <div class="nav">
                    </div>
                    <div class="banner">
                        <div class="title1"><a style="text-color: yellow">TRUNG TÂM ĐÀO TẠO VÀ SÁT HẠCH LÁI XE TRỰC TUYẾN</a></div>
                        <div class="title2"><br>Tầng 9, trường Đại Học Công Nghiệp Hà Nội</div>
                    </div>

                    <div class="menutop">
                        <ul>
                            <li style="width:90px;height:35;"><a style="color:#ffff00" href="index.jsp">Trang chủ</a></li>

                            <li style="width:90px;height:35px;color:#ffffff;"><a href="#">Sát hạch</a>
                                <ul>
                                    <li><a href="daotaoa1.jsp">Hạng A1</a>
                                    </li>
                                    <li><a href="#">Hạng A2</a></li>
                                </ul> 
                            </li>
                            <li style="width:70px;height:35px;color:#ffffff;"><a href="#">Đào tạo</a>
                                        <ul>
                                            <li><a href="video.jsp">Thực hành</a>
                                                
                                            </li>
                                            
                                            <%
                                                DmtlModel dm = new DmtlModel();
                                                for (Dmtl d : dm.danhsach()) {
                                            %>
                                            <li><a href="tracuutailieu.jsp?cat=<%= d.getDmtlMa()%>"><%= d.getDmtlTen()%></a></li>
                                                <% } %>
                                        </ul>
                                    </li>
                            <%
                                HttpSession ses = request.getSession();
                                if (ses != null) {
                                    Nguoidung u = (Nguoidung) ses.getAttribute("Member");
                                    if (u != null) {
                            %>
                            <li style="width:150px;height:35px;color:#ffffff;"><a href="thongtincanhan.jsp">Thông tin cá nhân</a></li>
                            <li style="width:70px;height:35px;color:#ffffff;"><a href="lichsu.jsp">Lịch sử</a></li>
                            <li style="width:90px;height:35px;color:#ffffff"><a href="nophoso.jsp">Nộp hồ sơ</a></li>
                            <li style="width:90px;height:35;color:#ffffff"><a href="NguoidungServlet?action=dangxuat">Đăng xuất</a></li>
                            <li style="width:300px;height:35px;color:#ffffff"><span>Xin chào <%= u.getNguoidungTen()%>!<span></li>
                                        <%
                                        } else {
                                        %>
                                        <li style="width:100px;height:35;color:#ffffff"><a href="dangnhap.jsp">Đăng nhập</a></li>
                                            <%
                                                    }
                                                }
                                            %>
                                        </ul>
                                        </div>
                                        </div>
