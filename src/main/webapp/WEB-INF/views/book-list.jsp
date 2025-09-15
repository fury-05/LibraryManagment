<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Library Books</title>
    <style>
        body { font-family: sans-serif; margin: 0; padding: 20px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        button { padding: 5px 10px; cursor: pointer; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <h1>Available Books</h1>
    <c:if test="${not empty message}">
        <p style="color: green;">${message}</p>
    </c:if>

    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Available Copies</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>${book.isbn}</td>
                    <td>${book.availableCopies}</td>
                    <td>
                        <c:if test="${book.availableCopies > 0}">
                            <form action="borrow" method="post" style="display:inline;">
                                <input type="hidden" name="bookId" value="${book.id}" />
                                <button type="submit">Borrow</button>
                            </form>
                        </c:if>
                        <c:if test="${book.availableCopies <= 0}">
                            <span>Unavailable</span>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>