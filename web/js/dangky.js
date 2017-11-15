function validate() {
    var pass1 = document.getElementById("pas");
    var pass2 = document.getElementById("repas");
    var ok = true;
    if (pass1.value != pass2.value) {
        //alert("Passwords Do not match");
        pass1.style.borderColor = "#E34234";
        pass2.style.borderColor = "#E34234";
        document.getElementById("result2").innerHTML = "Mật khẩu không trùng khớp";
        ok = false;
    }
    return ok;
}

function checkpas() {
    if ($("#pas").val() != $("#repas").val()) {
        //alert("Passwords Do not match");
        $("#pas").addClass("redborder");
        $("#repas").addClass("redborder");
        document.getElementById("result2").innerHTML = "Mật khẩu không trùng khớp";
    } else {
        $("#pas").removeClass("redborder");
        $("#repas").removeClass("redborder");
        document.getElementById("result2").innerHTML = "";
    }
}

function checkuser() {
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

    var acc = $("#acc");
    var para = "action=kiemtra&acc=" + acc.val();
    var url = "NguoidungServlet";

    try {
        request.onreadystatechange = function () {
            if (request.readyState == 4) {
                var val = request.responseText;
                document.getElementById("result").innerHTML = val;
                if (val != "") {
                    acc.addClass("redborder");
                } else
                    acc.removeClass("redborder");
            }
        };
        request.open("POST", url, true);
        request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        request.send(para);
    } catch (e) {
        alert("Unable to connect to server");
    }
}