<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <h2>Đăng nhập vào hệ thống</h2>

        <c:if test="${alert != null}">
            <h3 style="color: red">${alert}</h3>
        </c:if>
        
        <c:if test="${param.registered == 'true'}">
    		<h3 style="color: green">Đăng ký thành công, mời bạn đăng nhập</h3>
		</c:if>

        <p><input type="text" name="username" placeholder="Tài khoản"></p>
        <p><input type="password" name="password" placeholder="Mật khẩu"></p>
        <p><label><input type="checkbox" name="remember"> Nhớ tôi</label></p>
        <button type="submit">Đăng nhập</button>
    </form>
    <p>Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký</a></p>
</body>
</html>