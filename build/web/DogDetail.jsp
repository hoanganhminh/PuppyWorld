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
            .gallery-wrap .img-big-wrap img {
                width: 100%;
                display: inline-block;
            }            
        </style>
    </head>
    <body>
        <jsp:include page="HeaderMenu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                <jsp:include page="BodyLeft.jsp"></jsp:include>
                    <div class="col-sm-9">
                        <div class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-5 border-right" style="padding-right: 0">
                                        <article class="gallery-wrap"> 
                                            <div class="img-big-wrap">
                                                <div> <a href="#"><img src="${detail.image}"></a></div>
                                        </div>                                        
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7" style="text-align: center">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3" style="color: purple; font-weight: bold;font-size: 30px">${detail.name}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency"></span><span class="num" style="color: red">${detail.price}00 vnđ</span>
                                            </span> 
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt>Thông tin cún</dt>
                                            <dd><p>
                                                    ${detail.description}
                                                </p></dd>
                                        </dl>                                        
                                        <hr>
                                        <a href="addcart?pid=${o.id}" class="btn btn-lg btn-primary text-uppercase" style="background-color: purple;border: 1px solid purple"> MUA NGAY </a>
                                        <a href="addcart?pid=${o.id}" class="btn btn-lg btn-outline-primary text-uppercase" style="color: purple;border: 1px solid purple"> THÊM VÀO GIỎ </a>
                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->


                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
