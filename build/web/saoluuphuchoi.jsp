<%-- 
    Document   : backupdb
    Created on : May 30, 2017, 1:57:58 PM
    Author     : SONVU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/31.ID-Horizontal-64.png"></div>
            <h2 class="admin-title">Sao lưu và phục hồi dữ liệu</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="add-new-wrap">
                        <h3 class="form-title">Công cụ hệ thống</h3>
                        <form enctype="multipart/form-data">
                        <table class="add-new-table">
                            <tr>
                                <td>Sao lưu</td>
                                <td><input type="button" class="btn-form" name="backup" value="Sao lưu" onclick="saoluu();" /></td>
                            </tr>
                            <tr>
                                <td>Phục hồi</td>
                                <td>
                                    <input type="file" name="file" /><br/><br/> 
                                    <input type="button" class="btn-form" name="restore" value="Phục hồi" onclick="phuchoi();" />
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

