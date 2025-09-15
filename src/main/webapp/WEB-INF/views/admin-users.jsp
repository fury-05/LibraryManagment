<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="title" value="Manage Users" scope="request"/>
<jsp:include page="admin-header.jsp"/>

<h1 class="text-3xl font-bold text-gray-800 mb-6">Manage Users</h1>

<c:if test="${not empty message}">
    <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6" role="alert">
        <p>${message}</p>
    </div>
</c:if>

<div class="bg-white p-6 rounded-lg shadow mb-8">
    <h2 class="text-xl font-semibold mb-4">Pending Registrations</h2>
    <c:choose>
        <c:when test="${not empty pendingUsers}">
            <div class="overflow-x-auto">
                <table class="min-w-full">
                    <thead class="bg-gray-50">
                    <tr>
                        <th class="px-4 py-2 text-left">Name</th>
                        <th class="px-4 py-2 text-left">Email</th>
                        <th class="px-4 py-2 text-left">Department</th>
                        <th class="px-4 py-2 text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y">
                    <c:forEach var="user" items="${pendingUsers}">
                        <tr>
                            <td class="px-4 py-2">${user.name}</td>
                            <td class="px-4 py-2">${user.email}</td>
                            <td class="px-4 py-2">${user.department}</td>
                            <td class="px-4 py-2 text-center">
                                <form action="/library-management/admin/users/approve/${user.id}" method="post">
                                    <button type="submit" class="bg-green-500 text-white px-3 py-1 rounded hover:bg-green-600">Approve</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:when>
        <c:otherwise>
            <p class="text-gray-500">No pending registrations.</p>
        </c:otherwise>
    </c:choose>
</div>

<div class="bg-white p-6 rounded-lg shadow">
    <h2 class="text-xl font-semibold mb-4">Approved Users</h2>
     <div class="overflow-x-auto">
        <table class="min-w-full">
            <thead class="bg-gray-50">
            <tr>
                <th class="px-4 py-2 text-left">Name</th>
                <th class="px-4 py-2 text-left">Email</th>
                <th class="px-4 py-2 text-left">Department</th>
                <th class="px-4 py-2 text-left">Role</th>
            </tr>
            </thead>
            <tbody class="divide-y">
            <c:forEach var="user" items="${approvedUsers}">
                <tr>
                    <td class="px-4 py-2">${user.name}</td>
                    <td class="px-4 py-2">${user.email}</td>
                    <td class="px-4 py-2">${user.department}</td>
                    <td class="px-4 py-2">${user.role}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="footer.jsp"/>