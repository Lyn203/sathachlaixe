<%-- 
    Document   : themcauhoi
    Created on : Apr 30, 2017, 10:34:04 AM
    Author     : SONVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Thêm banner</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="add-new-wrap">
                        <h3 class="form-title">Thông tin đối tượng</h3>
                        <form method="post" action="BannerServlet?action=them" enctype="multipart/form-data">
                            <table class="add-new-table">
                                <tr>
                                    <td>Mã banner</td>
                                    <td>
                                        <input class="txt-form" type="text" name="bannerMa" disabled="disabled" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tên banner</td>
                                    <td>
                                        <input class="txt-form" type="text" name="bannerTen" value="" placeholder="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ảnh</td>
                                    <td>
                                        <input class="txt-form" type="file" name="bannerAnh" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tình trạng</td>
                                    <td>
                                        <label><input type="radio" name="bannerTinhtrang" value="1"/> Đang sử dụng</label>
                                        <label><input type="radio" name="bannerTinhtrang" value="0"/> Không sử dụng</label>
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
