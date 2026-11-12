<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa danh mục</title>
</head>
<body>
    <h2>Sửa danh mục</h2>
    <form action="${pageContext.request.contextPath}/admin/category/edit" method="post">
        <input type="hidden" name="id" value="${category.id}">
        <p>
            <label>Tên danh mục:
                <input type="text" name="catename" value="${category.name}">
            </label>
        </p>
        <button type="submit">Lưu</button>
        <a href="${pageContext.request.contextPath}/admin/category/list">Hủy</a>
    </form>
</body>
</html>