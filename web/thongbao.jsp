<%-- 
    Document   : thongbao
    Created on : May 30, 2017, 4:35:47 PM
    Author     : SONVU
--%>

<%@page import="model.ThongbaoModel"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table class="noti-table">
    <%
        ThongbaoModel tbm = new ThongbaoModel();
        LocalDateTime now = LocalDateTime.now();
        for (int i = tbm.danhsach().size() - 1; i > -1; i--) {
    %>
    <tr>
        <td>
            <%
                LocalDateTime time = LocalDateTime.parse(tbm.danhsach().get(i).getThongbaoThoigian());
                int sec = now.getSecond() - time.getSecond();
                int min = now.getMinute() - time.getMinute();
                int hour = now.getHour() - time.getHour();
                int day = now.getDayOfMonth() - time.getDayOfMonth();
                if (day > 0) {
                    if (hour < 0 && day == 1) {
                        out.print(24 - time.getHour() + now.getHour() + " giờ trước");
                    } else {
                        out.print(day + " ngày trước");
                    }
                } else if (day < 0) {
                    int bamot[] = {1, 3, 5, 7, 8, 10, 12};
                    int bamuoi[] = {4, 6, 9, 11};
                    for (int j : bamot) {
                        if (time.getMonthValue() == j) {
                            if (hour < 0 && (31 - time.getDayOfMonth() + now.getDayOfMonth()) == 1) {
                                out.print(24 - time.getHour() + now.getHour() + " giờ trước");
                            } else {
                                out.print(31 - time.getDayOfMonth() + now.getDayOfMonth() + " ngày trước");
                            }
                        }
                    }
                    for (int j : bamuoi) {
                        if (time.getMonthValue() == j) {
                            if (hour < 0 && (30 - time.getDayOfMonth() + now.getDayOfMonth()) == 1) {
                                out.print(24 - time.getHour() + now.getHour() + " giờ trước");
                            } else {
                                out.print(30 - time.getDayOfMonth() + now.getDayOfMonth() + " ngày trước");
                            }
                        }
                    }
                    if (time.getMonthValue() == 2) {
                        if (time.getYear() % 400 == 0) {
                            if (hour < 0 && (29 - time.getDayOfMonth() + now.getDayOfMonth()) == 1) {
                                out.print(24 - time.getHour() + now.getHour() + " giờ trước");
                            } else {
                                out.print(29 - time.getDayOfMonth() + now.getDayOfMonth() + " ngày trước");
                            }
                        } else if (time.getYear() % 4 == 0 && time.getYear() % 100 != 0) {
                            if (hour < 0 && (29 - time.getDayOfMonth() + now.getDayOfMonth()) == 1) {
                                out.print(24 - time.getHour() + now.getHour() + " giờ trước");
                            } else {
                                out.print(29 - time.getDayOfMonth() + now.getDayOfMonth() + " ngày trước");
                            }
                        } else {
                            if (hour < 0 && (28 - time.getDayOfMonth() + now.getDayOfMonth()) == 1) {
                                out.print(24 - time.getHour() + now.getHour() + " giờ trước");
                            } else {
                                out.print(28 - time.getDayOfMonth() + now.getDayOfMonth() + " ngày trước");
                            }
                        }
                    }
                } else if (day == 0) {
                    if (hour > 0) {
                        if (min < 0 && hour == 1) {
                            out.print(60 - time.getMinute() + now.getMinute() + " phút trước");
                        } else {
                            out.print(hour + " giờ trước");
                        }
                    } else if (hour == 0) {
                        if (min > 0) {
                            if (sec < 0 && min == 1) {
                                out.print(60 - time.getSecond()+ now.getSecond()+ " giây trước");
                            } else {
                                out.print(min + " phút trước");
                            }
                        } else if (min == 0) {
                            out.print(sec + " giây trước");
                        }
                    }
                }
//                out.print(time + " - " + now);
            %> 
        </td>
        <td class="dlt-noti">
            <%= tbm.danhsach().get(i).getThongbaoNoidung()%>
            <span class="x-noti" onclick="dltnoti(this.id)" id="<%= tbm.danhsach().get(i).getThongbaoMa() %>">x</span>
        </td>
    </tr>
    <% }%>
</table>