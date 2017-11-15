<%-- 
    Document   : themhoso
    Created on : Apr 28, 2017, 1:02:53 AM
    Author     : SONVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/31.ID-Horizontal-64.png"></div>
            <h2 class="admin-title">Thêm hồ sơ</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="add-new-wrap">
                        <h3 class="form-title">Thông tin đối tượng</h3>
                        <form method="post" action="HosoServlet?action=them" enctype="multipart/form-data">
                            <table class="add-new-table">
                                <tr>
                                    <td>Mã hồ sơ</td>
                                    <td>
                                        <input class="txt-form" type="text" name="hosoMa" disabled="disabled" placeholder=""/>
                                    </td>
                                    <td>Tên thí sinh</td>
                                    <td>
                                        <input class="txt-form" type="text" name="hosoTen" value="" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Số CMND</td>
                                    <td>
                                        <input class="txt-form" type="text" name="hosoCmnd" value="" placeholder=""/>
                                    </td>
                                    <td>SDT</td>
                                    <td>
                                        <input class="txt-form" type="text" name="hosoSdt" value="" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td>
                                        <input class="txt-form" type="text" name="hosoEmail" value="" placeholder=""/>
                                    </td>
                                    <td>Hạng thi</td>
                                    <td>
                                        <label><input type="radio" name="hosoHangthi" value="A1"/> A1</label>
                                        <label><input type="radio" name="hosoHangthi" value="A2"/> A2</label>
                                        <label><input type="radio" name="hosoHangthi" value="A3"/> A3</label>
                                        <label><input type="radio" name="hosoHangthi" value="A4"/> A4</label>
                                        <label><input type="radio" name="hosoHangthi" value="B1"/> B1</label>
                                        <label><input type="radio" name="hosoHangthi" value="B2"/> B2</label>
                                        <label><input type="radio" name="hosoHangthi" value="B3"/> B3</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ngày lập</td>
                                    <td>
                                        <input class="txt-form" type="text" name="hosoNgaylap" value="" placeholder=""/>
                                    </td>
                                    <td>Ngày thi</td>
                                    <td>
                                        <input class="txt-form" type="text" name="hosoNgaythi" value="" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Địa điểm thi</td>
                                    <td>
                                        <input class="txt-form" type="text" name="hosoDiadiem" value="" placeholder=""/>
                                    </td>
                                    <td>Ảnh CMND</td>
                                    <td>
                                        <input class="txt-form" type="file" name="hosoAnhcmnd" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ảnh chân dung</td>
                                    <td>
                                        <input class="txt-form" type="file" name="hosoAnhchandung" />
                                    </td>
                                    <td>Chứng nhận sức khỏe</td>
                                    <td>
                                        <input class="txt-form" type="file" name="hosoSuckhoe" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
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
