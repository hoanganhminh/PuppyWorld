<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quản lý chó</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href="https://i.pinimg.com/originals/89/59/2b/89592b3392fee110134235e95d80dbf7.jpg" type="image/icon type">
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
            body {
                cursor: url("css/rocket.png"),auto;
                background-image: url("https://aws1.discourse-cdn.com/standard17/uploads/clockworkpi/original/2X/d/d91e00cff54955320460f6e8e8d5ed5db770297e.gif")
            }
            .table-title{
                background-color: purple;
                border: 3px solid purple;
                transition: 0.5s all;                
            }
            .table-title h2{
                font-size: 30px;
                transition: 0.5s all;                
            }
            .table-title:hover{
                background-color: black               
            }
            .table-title:hover h2{
                color: aqua;
                font-size: 35px !important;                
            }
            .table-wrapper{
                border: 4px solid purple;
                transition: 0.5s all;
            }
            .table-wrapper:hover{
                border: 4px solid aqua;
            }
            th,td{
                text-align: center;
            }
            .themcho{
                font-weight: bold;
                background-color: aqua;
                color: black !important;
                border: 3px solid black !important;
                transition: 0.5s all
            }
            .themcho:hover{
                background-color: black !important;
                color: aqua !important;
                border: 3px solid aqua !important;
            }
            .quaylai{
                color: white;
                margin: 50px;
                font-size: 22px;
                text-decoration: none;
                font-weight: bold;
                transition: 0.5s all;
            }
            .quaylai:hover{
                color: aqua;
            }
        </style>
    <body>
        <a class="quaylai"href="home">Quay lại</a>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Bảng quản lý chó của <b>${sessionScope.acc.user}</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="formadddog" class="btn themcho"><i class="material-icons">&#xE147;</i> <span>Thêm chó mới</span></a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr style="color: black; font-size: 16px; font-weight: bold;">                            
                            <th>ID</th>
                            <th>Tên chó</th>
                            <th>Ảnh</th>
                            <th>Giá</th>
                            <th>Sửa/Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listP}" var="o">
                            <tr style="color: black; font-size: 16px; ">                                
                                <td>${o.id}</td>
                                <td>${o.name}</td>
                                <td>
                                    <img src="${o.image}">
                                </td>
                                <td>${o.price}00 vnđ </td>
                                <td>
                                    <a href="formeditdog?pid=${o.id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Sửa" style="color: aqua">&#xE254;</i></a>
                                    <a href="delete?pid=${o.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Xóa Cún">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>        
    </body>
</html>