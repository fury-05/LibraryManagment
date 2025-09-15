<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="title" value="Dashboard" scope="request"/>
<jsp:include page="header.jsp"/>

<h1 class="text-3xl font-bold text-gray-800 mb-6">Available Books</h1>

<c:if test="${not empty message}">
    <div class="bg-blue-100 border-t-4 border-blue-500 rounded-b text-blue-900 px-4 py-3 shadow-md mb-6" role="alert">
        <p class="font-bold">${message}</p>
    </div>
</c:if>

<div class="overflow-x-auto bg-white rounded-lg shadow">
    <table class="min-w-full">
        <thead class="bg-gray-200">
        <tr>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase tracking-wider">Title</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase tracking-wider">Author</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase tracking-wider">Category</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase tracking-wider">Available</th>
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
                    <c:if test="${book.availableCopies > 0}">
                        <form action="<c:url value="/user/borrow"/>" method="post" class="inline">
                            <input type="hidden" name="bookId" value="${book.id}"/>
                            <button type="submit" class="bg-green-500 text-white px-4 py-1 rounded hover:bg-green-600">Borrow</button>
                        </form>
                    </c:if>
                    <c:if test="${book.availableCopies <= 0}">
                        <span class="text-gray-500">Unavailable</span>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="footer.jsp"/>