<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
<div class="w-full max-w-sm bg-white p-8 rounded-lg shadow-md">
    <h2 class="text-2xl font-bold mb-6 text-center text-gray-800">Library Login</h2>

    <c:if test="${param.error}">
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
            Invalid username, password, or account not approved.
        </div>
    </c:if>
    <c:if test="${param.logout}">
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
            You have been logged out.
        </div>
    </c:if>
    <c:if test="${not empty message}">
         <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
            ${message}
        </div>
    </c:if>


    <form action="<c:url value="/perform_login"/>" method="post" class="space-y-4">
        <div>
            <label for="username" class="block text-gray-700">Username (Email or 'admin'/'user1')</label>
            <input type="text" id="username" name="username" required class="w-full mt-1 p-2 border rounded-md"/>
        </div>
        <div>
            <label for="password" class="block text-gray-700">Password</label>
            <input type="password" id="password" name="password" required class="w-full mt-1 p-2 border rounded-md"/>
        </div>
        <button type="submit" class="w-full bg-blue-600 text-white p-3 rounded-md hover:bg-blue-700">Login</button>
    </form>
    <p class="text-center mt-4"><a href="<c:url value="/register"/>" class="text-blue-600 hover:underline">Don't have an account? Register here.</a></p>
</div>
</body>
</html>