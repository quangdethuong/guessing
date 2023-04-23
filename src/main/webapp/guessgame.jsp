<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%--
    <%! %> : Thẻ dùng để khai báo biến
    <% %> : Thẻ dùng để xử lý logic code, thẻ đa năng
    <%= %> : Xuất giá trị của biến ra màn hình
--%>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <div class="row mt-5">
        <div class="col-md-5 m-auto mt-5">
            <h3 class="text-center">GAME ĐOÁN SỐ</h3>
            <div class="p-4 border mt-4">

                <% String contextPath = request.getContextPath(); %>

                <c:if test="${not empty name && not empty message}">
                    <c:set var="stringDisabled" value="readonly"/>
                    <c:set var="stringValue" value="${name}"/>
                </c:if>

                <form action="<%=contextPath%>/guessgame" method="post">
                    <div class="form-group">
                        <label>Họ tên người chơi</label>
                        <input type="text" class="form-control" name="name" value="${stringValue}" ${stringDisabled}
                               required>
                    </div>
                    <div class="form-group">
                        <label>Bạn hãy đoán 1 con số</label>
                        <input type="number" class="form-control" name="number">
                    </div>
                    <button type="submit" class="btn btn-primary">Play</button>
                </form>
                <form class="d-flex justify-content-end" style="margin-top: -36px;" action="<%=contextPath%>/guessgame" method="get">
                    <input type="hidden" name="newGame" value="true">
                    <button type="submit" class="btn btn-secondary ">NEW GANE</button>
                </form>
            </div>
        </div>
    </div>

    <h3 class="mt-5 text-center">${message}</h3>
    <table class="mt-5 table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Tên người chơi</th>
            <th scope="col">Số dự đoán</th>
            <th scope="col">Số hệ thống</th>
            <th scope="col">Số lần đoán</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${PlayerList}" var="item" varStatus="loop">
            <tr>
                <th scope="row">${loop.index + 1}</th>
                <td>${item.getName()}</td>
                <td>${item.getAnswer()}</td>
                <td>${item.getGuess()}</td>
                <td>${item.getCount()}</td>
            </tr>
        </c:forEach>


        </tbody>
    </table>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
