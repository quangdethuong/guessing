
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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

<div class="container mt-5">
    <h1 class="text-center mb-5">Game đoán số</h1>
    <% String contextPath = request.getContextPath(); %>


    <form action="<%=contextPath%>/guessgame" method="POST">
        <div class="form-group">
            <label for="name">Tên người chơi:</label>
            <input type="text" class="form-control" id="name" name="name"
                   required>
        </div>
        <div class="form-group">
            <label for="guess">Số của bạn:</label>
            <input type="number" class="form-control" id="guess" name="guess"
                   min="1" max="10" required>
        </div>
        <button type="submit" class="btn btn-primary">Đoán</button>
    </form>
    <h2>${hint}</h2>
    <h2>${messsage}</h2>
    <h2 class="mt-5">Danh sách người chơi</h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Tên người chơi</th>
            <th scope="col">Số lần đoán</th>
        </tr>
        </thead>
        <tbody>
<%--        <c:forEach var="player" items="${players}">--%>
        <tr>
<%--            <th scope="row">1</th>--%>
<%--            <td>${player.name}</td>--%>
<%--            <td>${player.getGuess()}</td>--%>
        </tr>
<%--        </c:forEach>--%>
        </tbody>
    </table>
</div>
<%--<div class="container">--%>
<%--    <div class="row mt-5">--%>
<%--        <div class="col-md-5 m-auto mt-5">--%>
<%--            <h3 class="text-center">ĐĂNG NHẬP HỆ THỐNG</h3>--%>
<%--            <div class="p-4 border mt-4">--%>

<%--                <% String contextPath = request.getContextPath(); %>--%>

<%--                <form action="<%=contextPath%>/login" method="post">--%>
<%--                    <div class="form-group">--%>
<%--                        <label>Email</label>--%>
<%--                        <input type="email" class="form-control" name="username">--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label>Mật khẩu</label>--%>
<%--                        <input type="password" class="form-control" name="password">--%>
<%--                    </div>--%>
<%--                    <button type="submit" class="btn btn-primary">Đăng nhập</button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
