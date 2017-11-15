$(document).ready(function () {
    $(".super-menu").click(function () {
        $(this).parent().find("ul").slideToggle(100);
        $(this).toggleClass("menu-item-opened");
        return false;
    });

    var showConfirm = false;
    $('.dx').click(function () {
        showConfirm = true;
    });
    function confirmExit() {
        if (showConfirm) {
            return "Trở về trang chủ.";
        }
    }
    window.onbeforeunload = confirmExit;

    var table = $(".list-table");
    $("#searchBox").keyup(function ()
    {
        var keyword = this.value;
        var re = new RegExp(keyword, "gi");
        $("tr:gt(0)", table).each(function ()
        {
            //if ($(this).find("td:first").text().search(re) > -1)
            if ($(this).text().search(re) > -1)
                $(this).fadeIn();
            else
                $(this).fadeOut();
        });
        //pagination(jQuery('.list-table tbody tr:visible'));
    });

    $("#logo").click(function () {
        $("#sidebar-menu").slideToggle();
    });

    pagination(jQuery('.list-table tbody tr'));
//    pagination(jQuery('.noti-table tbody tr'));

    var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
    var img = document.getElementsByClassName('myImg');
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");
    for (var i = 0; i < img.length; i++) {
        img[i].onclick = function () {
            modal.style.display = "block";
            modalImg.src = "upload/question/" + this.innerHTML;
            captionText.innerHTML = this.innerHTML;
        }
    }

// Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
    if (span) {
        span.onclick = function () {
            modal.style.display = "none";
        }
    }

    $.ajaxSetup(
            {
                cache: false,
                beforeSend: function () {
                    $('#content').fadeOut();
                    $('#loading').fadeIn();
                },
                complete: function () {
                    $('#loading').fadeOut();
                    $('#content').fadeIn();
                },
                success: function () {
                    $('#loading').fadeOut();
                    $('#content').fadeIn();
                }
            });
    var $container = $("#content");
    $container.load("thongbao.jsp");
    var refreshId = setInterval(function ()
    {
        $container.load('thongbao.jsp');
    }, 10000);

});

function pagination($tr) {
    var req_num_row = 5;
    //var $tr = jQuery('.list-table tbody tr');
    var total_num_row = $tr.length;
    var num_pages = 0;
    if (total_num_row % req_num_row == 0) {
        num_pages = total_num_row / req_num_row;
    }
    if (total_num_row % req_num_row >= 1) {
        num_pages = total_num_row / req_num_row;
        num_pages++;
        num_pages = Math.floor(num_pages++);
    }
    for (var i = 1; i <= num_pages; i++) {
        jQuery('.pagination').append("<li><a>" + i + "</a></li>");
    }
    $tr.each(function (i) {
        jQuery(this).hide();
        if (i + 1 <= req_num_row) {
            $tr.eq(i).show();
        }

    });
    jQuery('.pagination li:first a').addClass("active");
    jQuery('.pagination a').click(function (e) {
        e.preventDefault();
        $tr.hide();
        var page = jQuery(this).text();
        var temp = page - 1;
        var start = temp * req_num_row;
        //alert(start);

        for (var i = 0; i < req_num_row; i++) {
            $tr.eq(start + i).show();
        }
        jQuery('.pagination a').removeClass("active");
        jQuery(this).addClass("active");
    });

    tinymce.init({
        selector: '#detail',
        theme: 'modern',
        width: 900,
        height: 300,
        plugins: [
            'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
            'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
            'save table contextmenu directionality emoticons template paste textcolor'
        ],
        //content_css: 'css/content.css',
        toolbar: 'fontselect fontsizeselect | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist | link preview fullpage imageupload | forecolor backcolor emoticons',
        setup: function (editor) {
            var inp = $('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
            $(editor.getElement()).parent().append(inp);

            inp.on("change", function () {
                var input = inp.get(0);
                var file = input.files[0];
                var fr = new FileReader();
                fr.onload = function () {
                    var img = new Image();
                    img.src = fr.result;
                    editor.insertContent('<img src="' + img.src + '"/>');
                    inp.val('');
                }
                fr.readAsDataURL(file);
            });

            editor.addButton('imageupload', {
                text: "IMAGE",
                icon: false,
                onclick: function (e) {
                    inp.trigger('click');
                }
            });
        }
    });
}

function saoluu() {
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

    var para = "backup=" + document.forms[0]["backup"].value;

    try {
        request.onreadystatechange = function () {
            if (request.readyState == 4) {
                var val = request.responseText;
                alert(val);
            }
        }
        request.open("POST", "BackupRestoreDataBase", true);
        request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        request.send(para);
    } catch (e) {
        alert("Unable to connect to server");
    }
}

function phuchoi() {
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

    var para = "restore=" + document.forms[0]["restore"].value + "&file=" + document.forms[0]["file"].value.split("\\")[2];

    try {
        request.onreadystatechange = function () {
            if (request.readyState == 4) {
                var val = request.responseText;
                alert(val);
            }
        }
        request.open("POST", "BackupRestoreDataBase", true);
        request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        request.send(para);
    } catch (e) {
        alert("Unable to connect to server");
    }
}

function dltnoti(id) {
    $("#" + id).closest("tr").remove();
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

    var para = "action=xoa&thongbaoMa=" + id;

    try {
        request.onreadystatechange = function () {
            if (request.readyState == 4) {
                var val = request.responseText;

            }
        }
        request.open("POST", "ThongbaoServlet", true);
        request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        request.send(para);
    } catch (e) {
        alert("Unable to connect to server");
    }
}