<%-- 
    Document   : danhsachcauhoi
    Created on : Apr 30, 2017, 10:23:20 AM
    Author     : SONVU
--%>

<%@page import="entities.Cauhoi"%>
<%@page import="model.CauhoiModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="quantriheader.jsp"></jsp:include>

    <div id="container">

    <jsp:include flush="true" page="quantrisidebar.jsp"></jsp:include>

        <div id="admin-content">
            <div style="width: 70px; float: left; padding-left: 25px"><img src="image/Document_black-64.png"></div>
            <h2 class="admin-title">Danh sách câu hỏi hạng A1</h2>

            <div class="main-content-wrap">
                <div class="main-content">
                    <div class="list-wrap">
                        <div style="width: 300px; float: left">
                            <img src="image/add-circle-blue-128.png" width="15px" height="15px" style="padding-left: 5px"/>
                            <a href="themcauhoi.jsp" style="font-size: 20px">Thêm Câu Hỏi</a>

                        </div>
                        <div style="margin-left: 800px">
                            <div style="float: left">
                                <img src="image/698838-icon-111-search-32.png" width="20px" height="20px"/>
                            </div>
                            <div style="margin-top: 5px; margin-bottom: 5px">
                                <input type="text" id="searchBox" >
                            </div>
                        </div>
                        <form>
                            <table class="list-table">
                                <thead>
                                    <tr>
                                        <th>Mã câu hỏi</th>
                                        <th>Ảnh</th>
                                        <th>Câu hỏi</th>
                                        <th>Câu trả lời A</th>
                                        <th>Câu trả lời B</th>
                                        <th>Câu trả lời C</th>
                                        <th>Đáp án đúng</th>
                                        <th colspan="2">Tùy chọn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%CauhoiModel rm = new CauhoiModel();%>
                                <%for (int i = rm.cauHoiTheoHangThi("A1").size() - 1; i > -1; i--) {%>
                                <tr>
                                   <%String a = rm.cauHoiTheoHangThi("A1").get(i).getCauhoiAnh();
                                        String imageUrl=  "upload/question//noimage.JPG";
                                        if (a.length()>0){
                                            imageUrl= "upload/question/"+ a;
                                        }
                                            
                          

                                    %>
                                    <td class="cell-center"><%= rm.cauHoiTheoHangThi("A1").get(i).getCauhoiMa()%></td>
                                    <td class="img"><span class="img"><img class="img" src="<%=imageUrl%>"  width="60" height="60"></span></td>
                                     <td class="cell-center"><%= rm.cauHoiTheoHangThi("A1").get(i).getCauhoiNoidung()%></td>
                                     <td class="cell-center"><%= rm.cauHoiTheoHangThi("A1").get(i).getCauhoiDapana()%></td>
                                     <td class="cell-center"><%= rm.cauHoiTheoHangThi("A1").get(i).getCauhoiDapanb()%></td>
                                     <td class="cell-center"><%= rm.cauHoiTheoHangThi("A1").get(i).getCauhoiDapanc()%></td>
                                     <td class="cell-center"><%= rm.cauHoiTheoHangThi("A1").get(i).getCauhoiDapan()%></td>
                                    <td class="edit-cell"><a href="suacauhoi.jsp?action=sua&cauhoiMa=<%= rm.cauHoiTheoHangThi("A1").get(i).getCauhoiMa()%>">Sửa</a></td>
                                    <td class="delete-cell"><a href="CauhoiServlet?cauhoiMa=<%= rm.cauHoiTheoHangThi("A1").get(i).getCauhoiMa()%>&action=xoa" onclick="return confirm('Bạn muốn xóa?')">Xóa</a></td>
                                </tr>
                                <!--/c:forEach-->
                                <%}%>
                            </tbody>
                        </table>
                        <div class="pagination-div">
                            <ul class="pagination"></ul>
                        </div>
                    </form>
                            
                    <!-- The Modal -->
                    <div id="myModal" class="modal">
                        <span class="close">×</span>
                        <img class="modal-content" id="img01">
                        <div id="caption"></div>
                    </div>
                    
                </div><!--end .list-wrap-->
            </div><!--end .main-content-->
        </div><!--end .main-content-wrap-->
    </div><!--end #admin-content-->
</div><!--end #container-->

<jsp:include flush="true" page="quantrifooter.jsp"></jsp:include>

