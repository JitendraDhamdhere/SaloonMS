<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Package</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh;">
    <div style="background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); width: 400px;">
        <h2 style="text-align: center; color: #333;">Add Package</h2>
        <form action="packdata.jsp" method="post" style="display: flex; flex-direction: column; gap: 10px;">
            <label style="font-weight: bold;">Package Name:</label>
            <input type="text" name="package_name" required style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">
            
            <label style="font-weight: bold;">Description:</label>
            <textarea name="package_description" required style="padding: 8px; border: 1px solid #ccc; border-radius: 5px; height: 80px;"></textarea>
            
            <label style="font-weight: bold;">Price:</label>
            <input type="text" name="package_price" required style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">
            
            <input type="submit" value="Save Package" style="background: #28a745; color: #fff; padding: 10px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px;">
        </form>
    </div>
</body>
</html>