<c:set var="title" value="Dashboard" scope="request"/>
<jsp:include page="admin-header.jsp"/>

<h1 class="text-3xl font-bold text-gray-800 mb-6">Admin Dashboard</h1>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
    <div class="bg-white p-6 rounded-lg shadow">
        <h2 class="text-lg font-semibold text-gray-700">Pending Approvals</h2>
        <p class="text-3xl font-bold text-blue-600 mt-2">${pendingUsers}</p>
        <a href="<c:url value='/admin/users'/>" class="text-blue-500 hover:underline mt-4 inline-block">View Users</a>
    </div>
    <div class="bg-white p-6 rounded-lg shadow">
        <h2 class="text-lg font-semibold text-gray-700">Total Books in Library</h2>
        <p class="text-3xl font-bold text-green-600 mt-2">${totalBooks}</p>
         <a href="<c:url value='/admin/books'/>" class="text-green-500 hover:underline mt-4 inline-block">Manage Books</a>
    </div>
</div>

<div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
    <div class="bg-white p-6 rounded-lg shadow">
        <h2 class="text-lg font-semibold text-gray-700 mb-4">Books by Category</h2>
        <canvas id="categoryChart"></canvas>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Fetch data for the category chart
        fetch('<c:url value="/admin/api/stats/book-categories"/>')
            .then(response => response.json())
            .then(data => {
                const ctx = document.getElementById('categoryChart').getContext('2d');
                new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: Object.keys(data),
                        datasets: [{
                            label: 'Books by Category',
                            data: Object.values(data),
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.7)',
                                'rgba(54, 162, 235, 0.7)',
                                'rgba(255, 206, 86, 0.7)',
                                'rgba(75, 192, 192, 0.7)',
                                'rgba(153, 102, 255, 0.7)',
                                'rgba(255, 159, 64, 0.7)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                    }
                });
            });
    });
</script>

<jsp:include page="footer.jsp"/>