
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
        <!--Ghi nội dung vô đây-->






        <h1>Danh sách video</h1>
        <ul id="list-video">
            <li>
                <a href="https://www.youtube.com/embed/MG-vkcCVus0">Dạy lái xe 1</a>
            </li>
            <li>
                <a href="https://www.youtube.com/embed/MG-vkcCVus0">Dạy lái xe 2</a>

            </li>
        </ul>

        <div>
            <iframe width="560" height="315" src="https://www.youtube.com/embed/MG-vkcCVus0" frameborder="0" allowfullscreen/>
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

