<%-- 
    Document   : index
    Created on : Apr 30, 2017, 10:55:02 AM
    Author     : SONVU
--%>

<%@page import="entities.Thuchanh"%>
<%@page import="model.ThuchanhModel"%>
<%@page import="entities.Nguoidung"%>
<%@page import="java.util.List"%>
<%@page import="entities.Cauhoi"%>
<%@page import="model.CauhoiModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="indexheader.jsp"></jsp:include>
<%
    HttpSession ses = request.getSession();
    if (ses != null) {
        Nguoidung u = (Nguoidung) ses.getAttribute("Member");
%>
<div class="content">
    <form name="myForm" method="post" action="HosoServlet?action=them" enctype="multipart/form-data">
        <div class="main-content">
            <div class="add-new-wrap">
                <h3 class="form-title">Đăng ký thi lý thuyết lấy giấy phép lái xe hạng A1</h3>

                <table class="add-new-table">
                    <tr>
                        <% if (u != null) {%>
                        <td>Tên thí sinh</td>
                        <td>
                            <input class="txt-form" type="text" name="hosoTen" value="<%= u.getNguoidungTen()%>" placeholder="" autofocus/>
                        </td>
                        <td>Số CMND</td>
                        <td>
                            <input class="txt-form" type="text" name="hosoCmnd" value="<%= u.getNguoidungCmnd()%>" placeholder="" />
                        </td>
                        <% } else {%>
                        <td>Tên thí sinh</td>
                        <td>
                            <input class="txt-form" type="text" name="hosoTen" value="" placeholder="" autofocus/>
                        </td>
                        <td>Số CMND</td>
                        <td>
                            <input class="txt-form" type="text" name="hosoCmnd" value="" placeholder="" />
                        </td>
                        <% }%>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:center">
                            <!--<input class="btn-form" type="submit" name="submit" value="Bắt đầu thi lý thuyết"/>-->
                            <input class="btn-form" type="button" name="open" value="Bắt đầu thi lý thuyết"/>
                        </td>
                    </tr>
                </table>

            </div><!--end .list-wrap-->

        </div><!--end .main-content-->
        <div class="question">
            <div class="number">

                <%CauhoiModel rm = new CauhoiModel();
                    List<Cauhoi> list = rm.cauHoiTheoHangThi("A1");%>
                <%for (int i = 0; i < list.size(); i++) {%>

                <a class="ques"><%=i + 1%></a>
               <%}%>
                <div class="ques-img">
            
                     <%for (int i = 0; i < list.size(); i++) {%>
                <img class="img" src="upldad/question/<%= list.get(i).getCauhoiAnh()%>">

<!--                <tr>
                <label ><input type="text" class="textQuestion"value="<%="Câu " + (i + 1) + ": " + list.get(i).getCauhoiNoidung()%>"/></label>
                </tr>-->
<!--                <br>
                <tr>
                <label ><input type="text" class="textQuestion"value="<%="A."  + list.get(i).getCauhoiDapana()%>"/></label>
                </tr>
                <br>
                <tr>
                <label ><input type="text" class="textQuestion"value="<%="B."  + list.get(i).getCauhoiDapanb()%>"/></label>
                </tr>
                <br>
                <tr>
                <label ><input type="text" class="img"value="<%="C. "  + list.get(i).getCauhoiDapanc()%>"/></label>
                </tr>-->




                <div class="choice">
                    Câu <%= (i + 1)%>.
                    <label><input type="radio" class="choice<%= (i + 1)%>" name="choice<%= (i + 1)%>" value="1"/> 1</label>
                    <label><input type="radio" class="choice<%= (i + 1)%>" name="choice<%= (i + 1)%>" value="2"/> 2</label>
                    <label><input type="radio" class="choice<%= (i + 1)%>" name="choice<%= (i + 1)%>" value="3"/> 3</label>
                </div>
                <%}%>

                <div class="finish">
                    <span id="time"></span>
                    <label id="finish" data-toggle="modal" data-target="#myModal">Kết thúc</label>
                </div>
                <p class="clear"></p>
            </div>
            
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Kết quả</h4>
                    </div>
                    <div class="modal-body">
                        <div id="result">
                            <table class="result-table"> 
                                <tr>
                                    <td>Câu hỏi</td>
                                    <% for (Cauhoi r : rm.cauHoiTheoHangThi("A1")) {%>
                                    <td class="ques-num"><%= r.getCauhoiMa()%></td>
                                    <% } %>
                                </tr>
                                <tr>
                                    <td>Đáp án đúng</td>
                                    <% for (Cauhoi r : rm.cauHoiTheoHangThi("A1")) {%>
                                    <td>
                                        <a class="ans" target="_blank" href="chitiettailieu.jsp?tailieuMa=<%= r.getCauhoiThamkhao()%>"><%= r.getCauhoiDapan()%></a>
                                        <div class="note">
                                            <img class="note-img" src="upload/question/<%= r.getCauhoiAnh()%>"><br/>
                                            <span class="note-exp">Giải thích: <%= r.getCauhoiGiaithich()%></span>
                                        </div>
                                    </td>
                                    <% }%>
                                </tr>
                                <tr>
                                    <td>Đáp án của bạn</td>
                                    <% for (Cauhoi r : rm.cauHoiTheoHangThi("A1")) {%>
                                    <td class="result-ans"></td>
                                    <% }%>
                                </tr>
                            </table>
                            <br/>
                            <div id="kq"></div>
                            <br/>
                            <div id="pass">
                                <table class="add-new-table">
                                    <% if (u != null) {%>
                                    <tr>
                                        <td>SĐT</td>
                                        <td>
                                            <input class="txt-form" type="text" name="hosoSdt" value="<%= u.getNguoidungSdt()%>" placeholder="" />
                                        </td>
                                        <td>Email</td>
                                        <td>
                                            <input class="txt-form" type="email" name="hosoEmail" value="<%= u.getNguoidungEmail()%>" placeholder="" />
                                        </td>
                                    </tr>
                                    <% } else {%>
                                    <tr>
                                        <td>SĐT</td>
                                        <td>
                                            <input class="txt-form" type="text" name="hosoSdt" value="" placeholder="" />
                                        </td>
                                        <td>Email</td>
                                        <td>
                                            <input class="txt-form" type="email" name="hosoEmail" value="" placeholder="" />
                                        </td>
                                    </tr>
                                    <% }%>
                                    <tr>
                                        <td>Hạng thi</td>
                                        <td>
                                            <label><input type="radio" name="hosoHangthi" value="A1" checked/> A1</label>
                                            <label><input type="radio" name="hosoHangthi" value="A2"/> A2</label>
                                        </td>
                                        <td>Ngày thi lý thuyết</td>
                                        <td>
                                            <input class="txt-form" type="text" name="hosoNgaylap" value="" placeholder="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ngày thi thực hành</td>
                                        <td>
                                            <select class="cbb-form" name="hosoNgaythi">
                                                <option value=""></option>
                                                <% ThuchanhModel tm = new ThuchanhModel(); %>
                                                <% for (Thuchanh t : tm.danhsach()) {%>
                                                <option value="<%= t.getThuchanhNgay()%>"><%= t.getThuchanhNgay()%></option>
                                                <% }%>
                                            </select>
                                        </td>
                                        <td>Địa điểm</td>
                                        <td>
                                            <select class="cbb-form" name="hosoDiadiem">
                                                <option value=""></option>
                                                <% for (Thuchanh t : tm.danhsach()) {%>
                                                <option value="<%= t.getThuchanhMa()%>"><%= t.getThuchanhDiadiem()%> - <%= t.getThuchanhTinhtp()%></option>
                                                <% }%>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ảnh CMND</td>
                                        <td>
                                            <input class="txt-form" type="file" name="hosoAnhcmnd" />
                                        </td>
                                        <td>Ảnh chân dung</td>
                                        <td>
                                            <input class="txt-form" type="file" name="hosoAnhchandung" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Chứng nhận sức khỏe</td>
                                        <td>
                                            <input class="txt-form" type="file" name="hosoSuckhoe" />
                                        </td>
                                        <td></td>
                                        <td>
                                            <input class="btn-form" type="submit" name="submit" value="Gửi"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="fail">
                                Bạn thi trượt rồi!
                                <a href="daotaoa1.jsp">Thi lại?</a>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    </div>
                </div>

            </div>
        </div>
    </form> 
    <!--    <div class="introduction">
            <h3>Làm hết toàn bộ đề thi thử bằng lái xe A1 phía trên, đi thi chắc chắn đỗ 100%!</h3>
            <h5>Đây là bộ câu hỏi 150 câu hỏi thi sát hạch bằng lái xe máy A1. Thí sinh chỉ cần ôn hết đề thi bằng lái xe máy như trên đi thi sẽ qua một cách đơn giản. Để thi đỗ bằng lái xe máy A1 bạn phải làm đúng tối thiểu là 16/20 câu.</h5>
            <h3>Chúc các bạn ôn thi tốt và thi qua!</h3>
        </div>-->
</div>
<% }%>                                            
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
