<%-- 
    Document   : suacauhoi
    Created on : Apr 30, 2017, 10:36:50 AM
    Author     : SONVU
--%>

<%@page import="model.BannerModel"%>
<%@page import="entities.Banner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Cập nhật banner</h2>
        <%
            String action = request.getParameter("action");
            BannerModel rm = new BannerModel();

            if (action.equals("sua")) {
                Banner r = rm.thongtin(Integer.parseInt(request.getParameter("bannerMa")));


        %>
        <div class="main-content-wrap">
            <div class="main-content">
                <div class="add-new-wrap">
                    <h3 class="form-title">Thông tin đối tượng</h3>
                    <form method="post" action="BannerServlet?action=sua&bannerMa=<%= r.getBannerMa()%>">
                        <table class="add-new-table">
                            <tr>
                                <td>Mã banner</td>
                                <td>
                                    <input class="txt-form" type="text" name="bannerMa" value="<%= r.getBannerMa()%>" disabled="disabled" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Tên banner</td>
                                <td>
                                    <input class="txt-form" type="text" name="bannerTen" value="<%= r.getBannerTen()%>" placeholder=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Ảnh</td>
                                <td>
                                    <input class="txt-form" type="text" name="bannerAnh" value="<%= r.getBannerAnh()%>" placeholder="" />
                                </td>
                            </tr>
                            <tr>
                                <td>Tình trạng</td>
                                <td>
                                    <label><input type="radio" name="bannerTinhtrang" value="1"/> Đang sử dụng</label>
                                    <label><input type="radio" name="bannerTinhtrang" value="0"/> Không sử dụng</label>
                                </td>
                            </tr>     
                            <script type="text/javascript">
                                $("input[value='<%= r.getBannerTinhtrang()%>']").attr('checked', true);
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
