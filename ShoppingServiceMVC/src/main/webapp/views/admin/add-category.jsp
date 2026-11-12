<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm mới danh mục</title>
</head>
<body>
    <h2>Thêm danh mục mới</h2>
    <hr>
    <form action="add" method="post">
        <div>
            <label>Tên danh mục:</label><br>
            <input type="text" name="catename" required placeholder="Nhập tên danh mục...">
        </div>
        <br>
        <div>
            <button type="submit">Thêm mới</button>
            <a href="list">Quay lại danh sách</a>
        </div>
    </form>
</body>
</html>