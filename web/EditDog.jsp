<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    </head>
    <body>
        <style>
            body {
                cursor: url("css/rocket.png"),auto;
                background-image: url("https://aws1.discourse-cdn.com/standard17/uploads/clockworkpi/original/2X/d/d91e00cff54955320460f6e8e8d5ed5db770297e.gif")
            }
            form{
                text-align: center;  
                color: white;
                border: 3px solid white;
                border-radius: 5px;
            }
            input{
                text-align: center;
            }
            label{
                font-size: 20px
            }
            .khung{
                width: 80%;
                margin: 30px auto;
            }
            h1{
                text-transform: uppercase;
                transition: 0.5s all;
            }
            form:hover{
                border: 3px solid aqua;
            }
            form:hover h1{
                color: aqua
            }
            button:hover{
                border: 2px solid aqua;
                background: black;
                color: aqua;
            }
            .form-group{
                transition: 0.5s all;
            }
            .form-group:hover label{
                color: aqua
            }
            input, textarea{
                transition: 0.5s all;
            }
            .form-group:hover input,.form-group:hover textarea{
                border: 2px solid aqua;
            }
        </style>
        <div class="khung">
            <form action="edit" method="post">
                <div class="modal-header">						
                    <h1 class="modal-title">Sửa thông tin cún</h1>
                </div>
                <div class="modal-body">	
                    <input value="${detail.id}" name="id" type="text" class="form-control" style="display: none">                    
                    <div class="form-group">
                        <label>Tên</label>
                        <input value="${detail.name}" name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Ảnh</label>
                        <input value="${detail.image}" name="image" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Giá</label>
                        <input value="${detail.price}"  name="price" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Tiêu đề</label>
                        <textarea name="title" class="form-control" required>${detail.title}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Thông tin chi tiết</label>
                        <textarea name="description" class="form-control" required>${detail.description}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Loại cún</label>
                        <select name="category" class="form-select" style="padding: 0 5px; color: black;font-size: 19px"aria-label="Default select example">
                            <c:forEach items="${listC}" var="o">
                                <option style="color: black;font-size: 19px;padding: 0 5px"value="${o.cid}">${o.cname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button style="width: 80px; font-size: 18px; text-align: center; border-radius: 5px;transition: 0.5s all"><a style="color: red;text-decoration: none;font-weight: bold" href="manager">Cancer</a></button>
                    <input style="width: 80px; font-size: 18px"type="submit" class="btn btn-success" value="Sửa">
                </div>
            </form>
        </div>        
    </body>
</html>
