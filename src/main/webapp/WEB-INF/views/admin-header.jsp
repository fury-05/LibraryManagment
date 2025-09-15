<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin - ${title}</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">
<nav class="bg-indigo-800 text-white p-4">
    <div class="container mx-auto flex justify-between items-center">
        <a href="/library-management/admin/dashboard" class="text-xl font-bold">Admin Panel</a>
        <div>
            <a href="/library-management/admin/dashboard" class="px-4 hover:text-indigo-200">Dashboard</a>
            <a href="/library-management/admin/books" class="px-4 hover:text-indigo-200">Manage Books</a>
            <a href="/library-management/admin/users" class="px-4 hover:text-indigo-200">Manage Users</a>
            <a href="<c:url value="/logout"/>" class="ml-6 bg-red-600 px-4 py-2 rounded hover:bg-red-700">Logout</a>
        </div>
    </div>
</nav>
<main class="container mx-auto p-8 flex-grow">