<%-- 
    Document   : quantrisidebar
    Created on : Apr 29, 2017, 2:41:45 PM
    Author     : SONVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div id="sidebar-menu">
    <ul id="menu">
        <li><a href="tongquan.jsp">Tổng quan</a></li>
        <li><a class="super-menu" href="#">Quản lý sát hạch</a>
            <ul>
                <li><a href="danhsachhoso.jsp"><em>1</em>Danh sách Hồ sơ</a></li>
                <li><a href="danhsachlythuyet.jsp"><em>1</em>Danh sách Bài thi lý thuyết</a></li>
                <li><a href="danhsachthuchanh.jsp"><em>2</em>Danh sách Lịch thi thực hành</a></li>
            </ul>
        </li>
        <li><a class="super-menu" href="#">Quản lý dữ liệu</a>
            <ul>
                <li><a href="danhsachtailieu.jsp"><em>1</em>Danh sách Tài liệu</a></li>
                <li><a href="danhsachdmtl.jsp"><em>2</em>Danh sách Danh mục tài liệu</a></li>
            </ul>
        </li>
        <li><a class="super-menu" href="#">Quản lý đào tạo</a>
            <ul>
                <li><a href="danhsachcauhoiA1.jsp"><em>1</em>Danh sách Câu hỏi hạng A1</a></li>
                <li><a href="danhsachcauhoiA2.jsp"><em>2</em>Danh sách Câu hỏi hạng A2</a></li>
            </ul>
        </li>
        <li><a class="super-menu" href="#">Quản lý hệ thống</a>
            <ul>
                <li><a href="danhsachnguoidung.jsp"><em>1</em>Danh sách Người dùng</a></li>
                <li><a href="danhsachbanner.jsp"><em>1</em>Danh sách Banner</a></li>
                <li><a href="saoluuphuchoi.jsp"><em>1</em>Sao lưu và phục hồi</a></li>
            </ul>
        </li>
    </ul>
</div><!--end #sidebar-menu-->
