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
            <h2 class="admin-title">Thêm danh mục tài liệu</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="add-new-wrap">
                        <h3 class="form-title">Thông tin đối tượng</h3>
                        <form method="post" action="DmtlServlet?action=them">
                            <table class="add-new-table">
                                <tr>
                                    <td>Mã danh mục</td>
                                    <td>
                                        <input class="txt-form" type="text" name="dmtlMa" disabled="disabled" placeholder=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tên danh mục</td>
                                    <td>
                                        <input class="txt-form" type="text" name="dmtlTen" value="" placeholder=""/>
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
