var d = new Date();
var date = d.getDate();
if (date < 10) {
    date = "0" + date;
}
var month = d.getMonth() + 1;
if (month < 10) {
    month = "0" + month;
}

$(document).ready(function () {
    var item = document.getElementsByClassName("item");
    var li = document.getElementsByClassName("li-item");
    if (item.length > 0) {
        item[0].className += " active";
        li[0].className += " active";
    }

    if (document.forms["myForm"]) {
        if (document.forms["myForm"]["hosoNgaylap"]) {
            document.forms["myForm"]["hosoNgaylap"].value = date + "/" + month + "/" + d.getFullYear();
        }
        if (document.forms["myForm"]["hosoNgaythi"]) {
            document.forms["myForm"]["hosoNgaythi"].onchange = function () {
                var ngaythi = this.getElementsByTagName("option");
                var diadiem = document.forms["myForm"]["hosoDiadiem"].getElementsByTagName("option");
                for (var i = 0; i < ngaythi.length; i++) {
                    if (ngaythi[i].selected)
                        diadiem[i].selected = true;
                }
            }
        }
        if (document.forms["myForm"]["hosoDiadiem"]) {
            document.forms["myForm"]["hosoDiadiem"].onchange = function () {
                var diadiem = this.getElementsByTagName("option");
                var ngaythi = document.forms["myForm"]["hosoNgaythi"].getElementsByTagName("option");
                for (var i = 0; i < ngaythi.length; i++) {
                    if (diadiem[i].selected)
                        ngaythi[i].selected = true;
                }
            }
        }
        if (document.forms["myForm"]["open"]) {
            document.forms["myForm"]["open"].onclick = function () {
                if (document.forms["myForm"]["hosoTen"].value != "" && document.forms["myForm"]["hosoCmnd"].value != "") {
                    document.getElementsByClassName("main-content")[0].style.display = "none";
                    document.getElementsByClassName("question")[0].style.display = "block";
                    start();
                } else {
                    alert("Mời bạn điền đầy đủ thông tin");
                    if (document.forms["myForm"]["hosoTen"].value == "")
                        document.forms["myForm"]["hosoTen"].focus();
                    else
                        document.forms["myForm"]["hosoCmnd"].focus();
                }
            };
        }
    }
});

function start() {
    var ques = document.getElementsByClassName("ques");
    var img = document.getElementsByClassName("img");
    var choice = document.getElementsByClassName("choice");
    if (img.length > 0)
        img[0].style.display = "inline";
    if (choice.length > 0)
        choice[0].style.display = "inline";
    if (ques.length > 0) {
        ques[0].style.backgroundColor = "green";
        for (var i = 0; i < ques.length; i++) {
            ques[i].onclick = function () {
                for (var i = 0; i < ques.length; i++) {
                    ques[i].style.backgroundColor = "#66ccff";
                    img[i].style.display = "none";
                    choice[i].style.display = "none";
                    if (ques[i].innerHTML == this.innerHTML) {
                        img[i].style.display = "inline";
                        choice[i].style.display = "inline";
                    }
                }
                this.style.backgroundColor = "green";
            };
        }

        var time = 60 * 15,
                display = document.querySelector('#time');
        startTimer(time, display);

        $('#myModal').on('shown.bs.modal', function () {
            //document.getElementById("result").style.display = "block";
            document.getElementById("time").style.display = "none";
            var time = document.querySelector('#time').textContent;
            var ketqua = document.getElementById("kq");
            var resultans = document.getElementsByClassName("result-ans");
            var quesnum = document.getElementsByClassName("ques-num");
            var ans = document.getElementsByClassName("ans");
            var count = 0;
            ketqua.innerHTML += "Thời gian còn lại: <b>" + time + "</b>";
            for (var i = 0; i < ans.length; i++) {
                var choice = document.getElementsByClassName("choice");
                var ques = document.getElementsByClassName("ques");
                for (var j = 0; j < choice.length; j++) {
                    if (i == j) {
                        var check = false;
                        var radio = document.getElementsByClassName("choice" + (i + 1));
                        for (var k = 0; k < radio.length; k++) {
                            if (radio[k].checked) {
                                check = true;
                                resultans[i].innerHTML = radio[k].value;
                                if (radio[k].value == ans[i].innerHTML) {
                                    quesnum[i].style.color = "blue";
                                    count++;
                                } else {
                                    quesnum[i].style.color = "red";
                                    ques[i].style.backgroundColor = "red";
                                }
                            }
                        }
                        if (!check) {
                            resultans[i].innerHTML = "0";
                            quesnum[i].style.color = "red";
                            ques[i].style.backgroundColor = "red";
                        }
                    }
                }
                ans[i].parentElement.addEventListener("mouseover", function () {
                    //var noteimg = this.parentElement.getElementsByClassName("note-img")[0];
                    //var noteexp = this.parentElement.getElementsByClassName("note-exp")[0];
                    var note = this.getElementsByClassName("note")[0];
                    note.style.display = "block";
                    note.style.position = "absolute";
                    note.style.left = "0%";
                });
                ans[i].parentElement.addEventListener("mouseout", function () {
                    //var noteimg = this.parentElement.getElementsByClassName("note-img")[0];
                    //var noteexp = this.parentElement.getElementsByClassName("note-exp")[0];
                    var note = this.getElementsByClassName("note")[0];
                    note.style.display = "none";
                    //note.style.position = "absolute";
                });
            }
            ketqua.innerHTML += "<span class='right'>Bạn làm đúng <b id='ketqua'>" + count + "/" + ans.length + "</b> câu<span>";
            if (count > 15) {
                document.getElementById("pass").style.display = "block";
            } else {
                document.getElementById("fail").style.display = "block";
            }
            document.getElementById("finish").style.display = "none";
            themLyThuyet();
        });
    }
}

function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}

function themLyThuyet() {
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

    var resultans = document.getElementsByClassName("result-ans");
    var ketqua = document.getElementById("ketqua");
    var ans = "", cmnd = "";
    if (document.forms["myForm"]) {
        cmnd = document.forms["myForm"]["hosoCmnd"].value;
    }
    for (var i = 0; i < resultans.length; i++) {
        ans += resultans[i].innerHTML;
    }
    var para = "action=them&lythuyetCmnd=" + cmnd + "&lythuyetDapan=" + ans + "&lythuyetKetqua=" + ketqua.innerHTML + "&lythuyetNgaythi=" + date + "/" + month + "/" + d.getFullYear();

    try {
        request.onreadystatechange = function () {
            if (request.readyState == 4) {
                var val = request.responseText;

            }
        }
        request.open("POST", "LythuyetServlet", true);
        request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        request.send(para);
    } catch (e) {
        alert("Unable to connect to server");
    }
}