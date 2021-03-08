<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='assets/style/users.css' />" />
    </head>
    <body>
        <h1>Manage Users</h1>
        <h2>Users</h2>
        <p>${errorMessage}</p>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Delete</th>
                <th>Edit</th>
            </tr>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.firstname}</td>
                    <td>${user.lastname}</td>
                    <td>
                        <form action="users" method="post" >
                            <input type="submit" value="Delete">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="selectedUsername" value="${user.username}">
                        </form>
                    </td>
                    <td>
                        <form action="users" method="get">
                            <input type="submit" value="Edit">
                            <input type="hidden" name="action" value="view">
                            <input type="hidden" name="selectedUsername" value="${user.username}">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <c:if test="${selectedUser == null}">
            <h3>Add User</h3>
            <form action="users" method="POST">
                username: <input type="text" name="username"><br>
                password: <input type="password" name="password"><br>
                first name: <input type="text" name="firstname"><br>
                last name: <input type="text" name="lastname"><br>
                email: <input type="email" name="email"><br>
                <input type="hidden" name="action" value="add">
                <input type="submit" value="Save">
            </form>
        </c:if>
        <c:if test="${selectedUser != null}">
            <h3>Edit User</h3>
            <form action="users" method="POST">
                username: <input type="text" name="username" value="${selectedUser.username}" readonly><br>
                password: <input type="password" name="password" value="${selectedUser.password}"><br>
                first name: <input type="text" name="firstname" value="${selectedUser.firstname}"><br>
                last name: <input type="text" name="lastname" value="${selectedUser.lastname}"><br>
                email: <input type="email" name="email" value="${selectedUser.email}"><br>
                <input type="hidden" name="action" value="edit">
                <input type="submit" value="Save">
            </form>
        </c:if>
    </body>
</html>
