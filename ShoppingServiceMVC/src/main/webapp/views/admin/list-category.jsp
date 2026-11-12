<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý danh mục</title>
</head>
<body>
    <h2>Danh sách danh mục</h2>
    <hr>
    <a href="add">➕ Thêm danh mục mới</a><br><br>
    <table border="1" cellpadding="10">
        <thead>
            <tr>
                <th>STT</th>
                <th>Mã loại</th>
                <th>Tên danh mục</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${cateList}" var="cate" varStatus="STT">
                <tr>
                    <td>${STT.index + 1}</td>
                    <td>${cate.id}</td>
                    <td>${cate.name}</td>
                    <td>
                        <a href="<c:url value='/admin/category/edit?id=${cate.id}'/>">Sửa</a> | 
                        <a href="<c:url value='/admin/category/delete?id=${cate.id}'/>" onclick="return confirm('Bạn có chắc muốn xóa không?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>