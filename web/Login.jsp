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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="https://i.pinimg.com/originals/89/59/2b/89592b3392fee110134235e95d80dbf7.jpg" type="image/icon type">
        <title>Đăng Nhập</title>
    </head>
    <body>
        <a href="home" style="color: white;font-weight: bold;font-size: 25px;margin:45px;padding: 10px;">Quay lại</a>
        <div id="logreg-forms">
            <form class="form-signin" action="login" method="post">
                <h1> Đăng nhập</h1>
                <p style="color: greenyellow;text-align: center;font-weight: bold">${ok}</p>
                <p style="color: red;text-align: center;font-weight: bold">${wrong}</p>
                <input name="user"  type="text" id="inputEmail" class="form-control" placeholder="Tài khoản" required="" autofocus="">
                <input name="pass"  type="password" id="inputPassword" class="form-control" placeholder="Mật khẩu" required="">

                <button class="btn-block button1" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
                <hr>
                <button class="btn-block button2" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Đăng kí</button>
            </form>

            <form action="signup" method="post" class="form-signup">
                <h1> Đăng kí</h1>
                <input name="user" type="text" id="user-name" class="form-control" placeholder="Tên tài khoản" required="" autofocus="">
                <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Mật khẩu" required autofocus="">
                <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Nhập lại mật khẩu" required autofocus="">

                <button class="btn-block button1" type="submit"><i class="fas fa-user-plus"></i> Đăng kí</button>
                <a href="#" id="cancel_signup" style="text-decoration: none"><i class="fas fa-angle-left"></i> Quay lại</a>
            </form>
            <br>

        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
                    function toggleResetPswd(e) {
                    e.preventDefault();
                            $('#logreg-forms .form-signin').toggle() // display:block or none
                            $('#logreg-forms .form-reset').toggle() // display:block or none
                    }

            function toggleSignUp(e) {
            e.preventDefault();
                    $('#logreg-forms .form-signin').toggle(); // display:block or none
                    $('#logreg-forms .form-signup').toggle(); // display:block or none
            }

            $(() => {
            // Login Register Form
            $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                    $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                    $('#logreg-forms #btn-signup').click(toggleSignUp);
                    $('#logreg-forms #cancel_signup').click(toggleSignUp);
            })
        </script>
        <style>
            div{
                width: 50% !important;
                animation: slider 6s infinite ease-in-out;
                transition: 0.5s all;
                background-size: 150%;
                background-position: center;
                background-image: url('https://i.pinimg.com/originals/f6/9a/98/f69a983fb6ae0f701c053d55d71f5a84.gif') !important;
            }
            div:hover{
                box-shadow: 1px 1px 10px 10px aqua !important;
            }
            @keyframes slider {
                0% {
                    box-shadow: 1px 1px 10px 10px white;
                }
                25% {
                    box-shadow: 1px 1px 10px 10px purple;
                }
                50% {
                    box-shadow: 1px 1px 10px 10px aqua;
                }
                75% {
                    box-shadow: 1px 1px 10px 10px purple;
                }
                100% {
                    box-shadow: 1px 1px 10px 10px white;
                }
            }
            h1{
                font-weight: bold;
                color: black;
                font-size: 60px;
                text-align: center;
                -webkit-text-stroke: 2px purple;
                margin: 0 0 30px 0;
                transition: 0.5s all;
            }
            div:hover h1{
                -webkit-text-stroke: 2px aqua;
            }
            body {
                cursor: url("css/rocket.png"),auto;
                background-image: url("https://aws1.discourse-cdn.com/standard17/uploads/clockworkpi/original/2X/d/d91e00cff54955320460f6e8e8d5ed5db770297e.gif")
            }
            input{
                margin: 5px 0;
                border: 2px solid purple !important;
                text-align: center;
            }
            input:hover{
                border: 2px solid aqua !important;
            }
            .button1 {
                background-color: black;
                color: white;
                font-weight: bold;
                padding: 3px;
                transition: 0.5s all;
                font-size: 18px;
            }
            .button1:hover {
                font-size: 20px;
                color: purple;
                background-color: aqua;
                border: 1px solid aqua;
            }
            .button2 {
                background-color: black;
                color: greenyellow;
                font-weight: bold;
                padding: 3px;
                transition: 0.5s all;
                font-size: 18px;
            }
            .button2:hover {
                font-size: 20px;
                color: black;
                background-color: aqua;
                border: 1px solid aqua;
            }
        </style>
    </body>
</html>