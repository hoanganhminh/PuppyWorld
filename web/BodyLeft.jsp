<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card mb-3" id="cacloaicun">
        <div class="card-header text-white text-uppercase" id="cacloaicundiv" style="text-align: center; margin: 0;font-weight: bold;background-color: purple">Các loại cún</div>
        <ul class="list-group category_block">
            <c:forEach items="${listCC}" var="o"> 
                <!--thẻ tag ở dưới để đánh dấu, nếu tag là cid nào thì active, k thì thôi-->
                <li class="list-group-item thecun ${tag == o.cid ? "active":""}" style="text-align: center"><a href="${contextPath}/category?cid=${o.cid}">${o.cname}</a></li>
                </c:forEach>
        </ul>
    </div>  
    <div class="card mb-3" id="thucungmoinhat">
        <div class="card-header text-white text-uppercase" id="thucungmoinhattext" style="text-align: center; margin: 0;font-weight: bold;background-color: purple">Thú cưng mới nhất</div>
        <div class="card-body" style="background-color: white">
            <img class="img-fluid" src="${p.image}" />
            <h5 class="card-title"id="thucungmoinhath5" style="text-align: center; margin-top: 15px;font-weight: bold;color: purple;font-size: 25px">${p.name}</h5>
            <p class="card-text"style="text-align: center">${p.title}</p>
            <p class="bloc_left_price" style="color: white">${p.price}00 vnđ</p>
        </div>
    </div>
</div>
<style>
    #cacloaicun,#thucungmoinhat {
        border: 4px solid purple;
        border-radius: 5px;
        background-color: purple
    }
    #cacloaicun:hover,#thucungmoinhat:hover {
        border: 4px solid aqua;
        border-radius: 5px;
        background-color: aqua;
        transition: 0.5s all;

    }
    #cacloaicun:hover #cacloaicundiv,#thucungmoinhat:hover #thucungmoinhattext{
        background-color: aqua !important;
    }
    #thucungmoinhat:hover #thucungmoinhath5{
        color: aqua !important
    }
</style>