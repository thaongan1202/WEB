<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/register" method="post">
        <h2>Tạo tài khoản mới</h2>

        <c:if test="${alert != null}">
            <h3 style="color: red">${alert}</h3>
        </c:if>

        <p><input type="text" name="username" placeholder="Tài khoản" value="${param.username}"></p>
        <p><input type="text" name="fullname" placeholder="Họ tên" value="${param.fullname}"></p>
        <p><input type="email" name="email" placeholder="Email" value="${param.email}"></p>
        <p><input type="text" name="phone" placeholder="Số điện thoại" value="${param.phone}"></p>
        <p><input type="password" name="password" placeholder="Mật khẩu"></p>
        <p><input type="password" name="repassword" placeholder="Nhập lại mật khẩu"></p>
        <button type="submit">Tạo tài khoản</button>
    </form>
    <p>Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập</a></p>
</body>
</html>