<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puppy World</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="https://i.pinimg.com/originals/89/59/2b/89592b3392fee110134235e95d80dbf7.jpg" type="image/icon type">
        <link href="minhcss.css" rel="stylesheet">
        <style>
            input{
                text-align: center;
            }
            p{
                margin: 0 auto;
            }
        </style>
    </head>
    <body>
        <jsp:include page="HeaderMenu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                <jsp:include page="BodyLeft.jsp"></jsp:include>
                    <div class="col-sm-9">
                        <div class="container" style="background: white;text-align: center;border: 4px solid purple;padding: 20px;">
                            <h1>Xác nhận thanh toán</h1><br>
                            <form action="ordersuccess" method="post">
                                <p>Anh/Chị</p>
                                <input type="text" class="" value="${sessionScope.acc.user}" disabled>
                            <input name="user" type="text" class="" value="${sessionScope.acc.user}" style="display: none"><br>
                            <p>Tổng hóa đơn</p>
                            <input type="text" class="" value="${total.price}00đ" disabled><br>
                            <input name="totalPrice" type="text" class="" value="${total.price}00" style="display: none" >
                            <p>Số máy liên hệ</p>
                            <input name="phone" type="text" class="" placeholder="..........." required=""><br>
                            <p>Địa chỉ nhận hàng</p>
                            <input name="address" type="text" class="" placeholder="Địa chỉ" required=""><br><br>
                            <button class="" type="submit"><i class="fas fa-sign-in-alt"></i>Thanh toán</button>
                        </form>
                        <br>
                        <p>Hiện puppy chỉ hỗ trợ thanh toán khi nhận hàng, vui lòng để í điện thoại của bạn, nhân viên giao hàng sẽ sớm liên hệ xác nhận!</p>
                    </div>
                </div>
                <jsp:include page="Footer.jsp"></jsp:include>
                </body>
                </html>
