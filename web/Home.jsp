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
        <link href="minhcss.css" rel="stylesheet">
        <link rel="icon" href="https://i.pinimg.com/originals/89/59/2b/89592b3392fee110134235e95d80dbf7.jpg" type="image/icon type">
    </head>
    <body>        
        <jsp:include page="HeaderMenu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                <jsp:include page="BodyLeft.jsp"></jsp:include>       
                    <div class="col-sm-9" >
                        <nav aria-label="breadcrumb" style="display: ${display} none">
                        <ol class="breadcrumb" style="background: none;border: 2px solid purple;margin: 0;padding: 10px 40px;transition: 0.5s all">
                            <p style="margin: 0;color: white;font-weight: bold;font-size: 16px;color: purple;transition: 0.5s all">Sắp xếp theo:</p>
                            <li><a href="home" style="margin: 0 20px;color: white;">O</a></li>
                            <li><a href="tangdan" style="margin: 0 20px;color: white;">Giá tăng dần</a></li>
                            <li><a href="giamdan" style="margin: 0 20px;color: white;">Giá giảm dần</a></li>
                            <li><a href="moinhat" style="margin: 0 20px;color: white;">Mới nhất</a></li>
                            <li><a href="cunhat" style="margin: 0 20px;color: white;">Cũ nhất</a></li>
                            <li><a href="tungloai" style="margin: 0 20px;color: white;">Từng loại</a></li>
                        </ol>
                    </nav>
                    <div class="row khung" style="height: 1010px;overflow: auto;border-bottom: 2px solid purple">
                        <c:forEach items="${listP}" var="o">
                            <div class="col-12 col-md-6 col-lg-4 thecho">
                                <div class="card noidungthecho">
                                    <img class="card-img-top" src="${o.image}" alt="Card image cap" style="width: 100%;height: 220px;border-bottom: 1px solid purple;margin: 0;border-radius: 3px 3px 0 0;">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt" style="text-align: center;"><a href="detail?pid=${o.id}" style="color: purple;font-weight: bold">${o.name}</a></h4>
                                        <p class="card-text show_txt" style="text-align: center">${o.title}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-block thegiatien" style="background-color: aqua;color: white;font-weight: bold">${o.price}00 vnđ</p>
                                            </div>
                                            <c:if test="${sessionScope.acc == null}">
                                                <div class="col">
                                                    <a href="Login.jsp" class="btn btn-block themvaogio" style="background-color: aqua;color: white;font-weight: bold">Thêm vào giỏ</a>
                                                </div>
                                            </c:if>
                                            <c:if test="${sessionScope.acc != null}">
                                                <div class="col">
                                                    <a href="addcart?pid=${o.id}" class="btn btn-block themvaogio" style="background-color: aqua;color: white;font-weight: bold">Thêm vào giỏ</a>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
    <style>
        ::-webkit-scrollbar{
            width: 9px;
            background-image: url("https://aws1.discourse-cdn.com/standard17/uploads/clockworkpi/original/2X/d/d91e00cff54955320460f6e8e8d5ed5db770297e.gif");
        }
        ::-webkit-scrollbar-thumb{
            background: linear-gradient(transparent, purple ,transparent);  
        }
        ::-webkit-scrollbar-thumb:hover{
            background: linear-gradient(transparent, aqua ,transparent);            
        }
        .breadcrumb:hover{
            border: 2px solid aqua !important
        }
        .breadcrumb:hover p{
            color: aqua !important
        }
    </style>
</html>

