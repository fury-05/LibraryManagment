<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="title" value="Manage Books" scope="request"/>
<jsp:include page="admin-header.jsp"/>

<h1 class="text-3xl font-bold text-gray-800 mb-6">Manage Books</h1>

<c:if test="${not empty message}">
    <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6" role="alert">
        <p>${message}</p>
    </div>
</c:if>

<div class="bg-white p-6 rounded-lg shadow mb-8">
    <h2 class="text-xl font-semibold mb-4">Add a New Book</h2>
    <form:form action="/library-management/admin/books/add" method="post" modelAttribute="book" class="grid grid-cols-1 md:grid-cols-3 gap-4 items-end">
        <div>
            <label for="title" class="block text-sm font-medium text-gray-700">Title</label>
            <form:input path="title" id="title" required="true" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2"/>
        </div>
        <div>
            <label for="author" class="block text-sm font-medium text-gray-700">Author</label>
            <form:input path="author" id="author" required="true" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2"/>
        </div>
         <div>
            <label for="category" class="block text-sm font-medium text-gray-700">Category</label>
            <form:input path="category" id="category" required="true" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2"/>
        </div>
        <div>
            <label for="isbn" class="block text-sm font-medium text-gray-700">ISBN</label>
            <form:input path="isbn" id="isbn" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2"/>
        </div>
        <div>
            <label for="availableCopies" class="block text-sm font-medium text-gray-700">Copies</label>
            <form:input path="availableCopies" id="availableCopies" type="number" required="true" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2"/>
        </div>
        <div class="md:col-start-3">
            <button type="submit" class="w-full bg-blue-600 text-white p-2 rounded-md hover:bg-blue-700">Add Book</button>
        </div>
    </form:form>
</div>

<div class="overflow-x-auto bg-white rounded-lg shadow">
    <table class="min-w-full">
        <thead class="bg-gray-200">
        <tr>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase tracking-wider">Title</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase tracking-wider">Author</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase tracking-wider">Category</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase tracking-wider">Copies</th>
            <th class="px-6 py-3 text-center text-xs font-medium text-gray-600 uppercase tracking-wider">Action</th>
        </tr>
        </thead>
        <tbody class="divide-y divide-gray-200">
        <c:forEach var="book" items="${books}">
            <tr>
                <td class="px-6 py-4 whitespace-nowrap">${book.title}</td>
                <td class="px-6 py-4 whitespace-nowrap">${book.author}</td>
                <td class="px-6 py-4 whitespace-nowrap">${book.category}</td>
                <td class="px-6 py-4 whitespace-nowrap">${book.availableCopies}</td>
                <td class="px-6 py-4 whitespace-nowrap text-center">
                    <form action="/library-management/admin/books/delete/${book.id}" method="post" class="inline">
                        <button type="submit" class="bg-red-500 text-white px-4 py-1 rounded hover:bg-red-600">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="footer.jsp"/>