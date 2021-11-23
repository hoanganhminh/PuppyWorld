<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-md navbar-dark" style="border-bottom: 4px solid purple;background-color: black">
    <div class="container">
        <a class="navbar-brand" href="home" style="font-size: 35px;color: purple;font-weight: bold">Puppies</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav" style="text-align: right;margin: 0 5%">                        
                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="admincontrol">Quản lý Shop Puppy</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.isSell == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="manager">Quản lý Sản Phẩm</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="">Chào ${sessionScope.acc.user}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Đăng xuất</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="Login.jsp">Đăng nhập</a>
                    </li>
                </c:if>
            </ul>
            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm divtimkiem">
                    <input value="${tim}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Tìm kiếm...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number searchbut" style="background-color: purple;transition: 0.5s all">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <c:if test="${sessionScope.acc == null}">
                    <a class="btn btn-success btn-sm ml-3 giohang" href="Login.jsp"style="border: 2px solid purple;background-color: purple;border-radius: 5px;font-weight: bold;transition: 0,5s all">
                        <i class="fa fa-shopping-cart"></i> Giỏ hàng
                    </a>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <a class="btn btn-success btn-sm ml-3 giohang" href="cart"style="border: 2px solid purple;background-color: purple;border-radius: 5px;font-weight: bold;transition: 0,5s all">
                        <i class="fa fa-shopping-cart"></i> Giỏ hàng
                    </a>
                </c:if>
            </form>
        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading" style="font-weight: bold;color: purple;font-size: 70px;-webkit-text-stroke: 2px white;">Cửa hàng thú cưng Puppy</h1>
        <p class="lead mb-0" style="color: white">Cung cấp những giống cún đáng yêu cho ngôi nhà của bạn!</p>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb navhome" style="background: none;border: 4px solid purple;transition: 0.5s all">
                    <li class="breadcrumb-item"><a href="home" style="color: white">Home</a></li>
                    <li class="breadcrumb-item"><a href="#" style="color: white">Danh Mục Cún</a></li>
                </ol>
            </nav>
        </div>
    </div>
</div>
<style>
    .navbar-brand,.jumbotron-heading,.lead{
        transition: 0.5s all;
    }
    nav:hover .navbar-brand{
        color: aqua !important;
    }
    section:hover .jumbotron-heading{
        color: aqua !important;
        font-size: 74px !important;
    }
    section:hover .lead{
        color: aqua !important;
    }
    li a{
        transition: 0.5s all;
    }
    li a:hover{
        color: aqua !important;
    }
    .divtimkiem {
        border: 2px solid purple;
        background-color: purple;
        border-radius: 5px;
        transition: 0.5s all;
    }
    .divtimkiem:hover {
        border: 2px solid aqua;
        background-color: aqua;
    }
    .divtimkiem:hover .searchbut{
        background-color: aqua !important;
    }
    .giohang:hover{
        background-color: aqua !important;
        border: 2px solid aqua !important;
    }
    .navhome:hover{
        border: 4px solid aqua !important;
    }
</style>