<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Register</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center py-12">
<div class="w-full max-w-2xl bg-white p-8 rounded-lg shadow-md">
    <h2 class="text-2xl font-bold mb-6 text-center text-gray-800">Student Registration</h2>
    <form:form action="register" method="post" modelAttribute="user" class="space-y-4">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
                <label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
                <form:input path="name" id="name" required="true" class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm"/>
            </div>
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
                <form:input path="email" id="email" type="email" required="true" class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm"/>
            </div>
            <div>
                <label for="phone" class="block text-sm font-medium text-gray-700">Phone Number (e.g. +91 1234567890)</label>
                <form:input path="phone" id="phone" required="true" class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm"/>
            </div>
            <div>
                <label for="department" class="block text-sm font-medium text-gray-700">Department</label>
                <form:input path="department" id="department" required="true" class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm"/>
            </div>
            <div>
                <label for="studyYear" class="block text-sm font-medium text-gray-700">Year of Study</label>
                <form:input path="studyYear" id="studyYear" type="number" required="true" class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm"/>
            </div>
            <div>
                <label for="rollNumber" class="block text-sm font-medium text-gray-700">Roll Number</label>
                <form:input path="rollNumber" id="rollNumber" required="true" class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm"/>
            </div>
            <div class="md:col-span-2">
                <label for="studentNumber" class="block text-sm font-medium text-gray-700">Student ID Number</label>
                <form:input path="studentNumber" id="studentNumber" required="true" class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm"/>
            </div>
             <div class="md:col-span-2">
                <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                <form:password path="password" id="password" required="true" class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm"/>
            </div>
        </div>

        <div class="pt-4">
            <button type="submit" class="w-full bg-blue-600 text-white p-3 rounded-md hover:bg-blue-700">Submit for Approval</button>
        </div>
    </form:form>
    <p class="text-center mt-4"><a href="<c:url value="/login"/>" class="text-blue-600 hover:underline">Already have an account? Login.</a></p>
</div>
</body>
</html>