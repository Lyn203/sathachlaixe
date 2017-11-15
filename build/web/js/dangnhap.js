function signin() {
    var request;
    try {
        request = new XMLHttpRequest();
    } catch (e) {
        try {
            request = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {
                alert("Your browser does not support AJAX!");
            }
        }
    }

    var acc = document.getElementById("acc").value;
    var pas = document.getElementById("pas").value;
    var para = "action=dangnhap&acc=" + acc + "&pas=" + pas;
    var url = "NguoidungServlet";

    try {
        request.onreadystatechange = function () {
            if (request.readyState == 4) {
                var val = request.responseText;
                document.getElementById("result").innerHTML = val;
            }
        };
        request.open("POST", url, true);
        request.send(para);
    } catch (e) {
        alert("Unable to connect to server");
    }
}

$(document).ready(function(){
//    if (document.getElementById("result").innerHTML.trim() == "error") {
//        document.getElementById("result").innerHTML = "Đăng nhập không thành công";
//    } else if (document.getElementById("result").innerHTML.trim() == "success") {
//        document.getElementById("result").innerHTML = "Đăng ký thành công";
//    } else document.getElementById("result").innerHTML = "";
});