<%-- 
    Document   : index
    Created on : Apr 30, 2017, 10:55:02 AM
    Author     : SONVU
--%>

<%@page import="entities.Tailieu"%>
<%@page import="model.TailieuModel"%>
<%@page import="entities.Hoso"%>
<%@page import="model.HosoModel"%>
<%@page import="entities.Banner"%>
<%@page import="model.BannerModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="indexheader.jsp"></jsp:include>

    <div class="content">
        <div class="lcontent">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                <% BannerModel rm = new BannerModel(); %>
                <%for (int i = 0; i < rm.bannerTheoTinhTrang("1").size(); i++) {%>
                <li class="li-item" data-target="#myCarousel" data-slide-to="<%=i%>"></li>
                    <%}%>
            </ol>
            <div class="carousel-inner" role="listbox">

                <%for (Banner r : rm.bannerTheoTinhTrang("1")) {%>
                <div class="item">
                    <img src="upload/banner/<%= r.getBannerAnh()%>" alt="<%= r.getBannerTen()%>" />
                </div>
                <%}%>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div class="gioithieu">
            <h5 class="ttds"> <strong>•</strong> Giới thiệu</h5>
            <a>
                <p>
                    Trung tâm đào tạo và sát hạch lái xe được thành lập tháng 4 năm 2017 với nhiệm vụ chính là đào tạo nghề lái xe mô tô hạng A1 và ô tô đến hạng B2.
                    Ngày 22/12/2005 cùng với việc nâng cấp Trường Cao đẳng Công nghiệp Hà Nội thành Trường Đại học Công nghiệp Hà Nội, Ban dạy nghề lái xe được đổi tên thành Trung tâm Đào tạo và sát hạch lái xe trực tuyến.
                    Trung tâm Đào tạo và sát hach lái xe trực tuyến  là một đơn vị cơ sở trực thuộc Trường Đại học Công nghiệp Hà Nội. Trung tâm được giao nhiệm vụ: Tuyển sinh, Đào tạo để cấp Giấy phép lái xe cơ giới đường bộ theo Giấy phép đào tạo được cấp theo quy định.Trung tâm là một trong những đơn vị thực hiện một khâu trong chuỗi đào tạo nghề cho người học ( Trong lúc học các ngành nghề khác, người học có thể học thêm nghề lái xe để phục vụ cho giao thông đi lại của bản thân hoặc thực hành nghề lái xe khi cần thiết).
                    Thành tích nổi bật:
                    * Năm 2009 Trung tâm Đào tạo lái xe đạt giải Ba Hội thi " Giáo viên dạy giỏi nghề Lái xe Ô tô" do Sở GTVT Hà Nội tổ chức
                    * Năm 2013 tại Văn phòng Bộ Công Thương, Hội đồng nghiệm thu đề tài KHKT Bộ đã tổ chức nghiệm thu đề tài NCKH cấp Bộ - Đề tài: "Nghiên cứu thiết kế, chế tạo, lắp đặt và vận hành ổn định hệ thống báo lỗi tự động cho một số bài tập lái xe ô tô hạng B" do PGS. TS. Lê Hồng Quân chủ nhiệm cùng tham gia có các giáo viên của Trung tâm ĐTLX. 
                </p>
            </a>
        </div>
    </div>

    <div class="rcontent">
        <div class="boxtintuc">
            <h5 class="ttds"> <strong>•</strong> Thông tin mới</h5>
            <%
                int count = 0;
                TailieuModel tm = new TailieuModel();
                for (int i = tm.danhsach().size() - 1; i > -1; i--) {
                    count++;
            %>
            <a href="chitiettailieu.jsp?tailieuMa=<%= tm.danhsach().get(i).getTailieuMa()%>" style="font-size:14px; padding-right:10px;">
                <span><%= tm.danhsach().get(i).getTailieuTen()%></span>
            </a>
            <br>
            <br>
            <%
                    if (count == 5) {
                        break;
                    }
                }
            %>
        </div>
        <div class="dshv">
            <h5 class="ttds"> <strong>•</strong> Danh sách học viên</h5>
            <div class="anhhv">
                <div class="row">
                    <% HosoModel hm = new HosoModel(); %>
                    <% for (Hoso h : hm.danhsach()) {%>
                    <div>
                        <img src="upload/profile/<%= h.getHosoAnhchandung()%>" class="anhhocvien" alt="<%= h.getHosoTen()%>">
                        <p><%= h.getHosoTen()%></p>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
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
