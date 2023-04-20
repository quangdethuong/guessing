
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


<div class="container">
    <div class="row mt-5">
        <div class="col-md-5 m-auto mt-5">
            <h3 class="text-center">ĐĂNG NHẬP HỆ THỐNG</h3>
            <div class="p-4 border mt-4">

                <% String contextPath = request.getContextPath(); %>

                <form action="<%=contextPath%>/login" method="post">
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" name="username">
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu</label>
                        <input type="password" class="form-control" name="password">
                    </div>
                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <h1 class="text-center mt-5">Guessing Game</h1>
    <div class="row justify-content-center">
        <div class="col-md-4 mt-5">
            <form action="guess" method="post">
                <div class="form-group">
                    <label for="guess">Enter your guess (1-1000):</label>
                    <input type="number" class="form-control" id="guess" name="guess" min="1" max="1000" required>
                </div>
                <button type="submit" class="btn btn-primary">Guess</button>
            </form>
            <c:if test="${not empty hint}">
                <div class="alert alert-danger mt-3">${hint}</div>
            </c:if>
        </div>
    </div>
    <c:if test="${not empty players}">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <table class="table table-bordered">
                    <thead class="thead-light">
                    <tr>
                        <th>Rank</th>
                        <th>Player Name</th>
                        <th>Guesses</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="player" items="${players}">
                        <tr>
                            <td>${player.rank}</td>
                            <td>${player.name}</td>
                            <td>${player.guesses}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>
</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>