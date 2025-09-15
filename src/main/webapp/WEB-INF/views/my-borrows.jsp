<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="title" value="My Borrows" scope="request"/>
<jsp:include page="header.jsp"/>

<h1 class="text-3xl font-bold text-gray-800 mb-6">My Borrow History</h1>

<div class="overflow-x-auto bg-white rounded-lg shadow">
    <table class="min-w-full">
        <thead class="bg-gray-200">
        <tr>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase tracking-wider">Book Title</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase tracking-wider">Borrow Date</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase tracking-wider">Return Date</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase tracking-wider">Status</th>
            <th class="px-6 py-3 text-center text-xs font-medium text-gray-600 uppercase tracking-wider">Action</th>
        </tr>
        </thead>
        <tbody class="divide-y divide-gray-200">
        <c:forEach var="record" items="${records}">
            <tr>
                <td class="px-6 py-4 whitespace-nowrap">${record.book.title}</td>
                <td class="px-6 py-4 whitespace-nowrap">${record.borrowDate}</td>
                <td class="px-6 py-4 whitespace-nowrap">${record.returnDate != null ? record.returnDate : 'N/A'}</td>
                <td class="px-6 py-4 whitespace-nowrap">
                    <c:if test="${record.status == 'BORROWED'}">
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">Borrowed</span>
                    </c:if>
                    <c:if test="${record.status == 'RETURNED'}">
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Returned</span>
                    </c:if>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-center">
                    <c:if test="${record.status == 'BORROWED'}">
                         <form action="<c:url value="/return"/>" method="post" class="inline">
                            <input type="hidden" name="recordId" value="${record.id}"/>
                            <button type="submit" class="bg-blue-500 text-white px-4 py-1 rounded hover:bg-blue-600">Return</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="footer.jsp"/>