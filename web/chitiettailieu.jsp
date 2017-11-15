<%-- 
    Document   : index
    Created on : Apr 30, 2017, 10:55:02 AM
    Author     : SONVU
--%>

<%@page import="entities.Dmtl"%>
<%@page import="model.DmtlModel"%>
<%@page import="entities.Tailieu"%>
<%@page import="model.TailieuModel"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include flush="true" page="indexheader.jsp"></jsp:include>

    <div class="content">
        <div class="main-content-detail">
            <div class="add-new-wrap">
                <% 
                    TailieuModel rm = new TailieuModel();
                    Tailieu t = rm.thongtin(Integer.parseInt( request.getParameter("tailieuMa")));
                %>
                <h3 class="form-title"><%= t.getTailieuTen()%></h3>
                <div class="detail"><%= t.getTailieuNoidung() %></div>
            </div><!--end .list-wrap-->

        </div><!--end .main-content-->
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
