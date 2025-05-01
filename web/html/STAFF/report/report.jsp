    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.text.*" %>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Sales Report</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/report.css">
        
    </head>
    <body>
    <h1>Sales Report</h1>

    <div class="button-group">

        <form method="get" action="${pageContext.request.contextPath}/ReportServlet">
            <div class="report-buttons">
                <button type="submit" name="type" value="top10">Top 10 Sold Products</button>
            </div>
        </form>

        <form method="get" action="${pageContext.request.contextPath}/ReportServlet" id="dailyForm">
            <div class="report-buttons">
                <button type="button" onclick="toggleDropdown('daily')">Daily Sales</button>
            </div>
            <div class="dropdown-inputs">
                <div id="daily-dropdown" class="dropdown-container" style="display: none;">
                    <input type="hidden" name="type" value="daily">
                    <input type="date" name="date" required>
                    <button type="submit" class="submit-btn">Generate Daily Report</button>
                </div>
            </div>
        </form>

        <form method="get" action="${pageContext.request.contextPath}/ReportServlet" id="monthlyForm">
            <div class="report-buttons">
                <button type="button" onclick="toggleDropdown('monthly')">Monthly Sales</button>
            </div>
            <div class="dropdown-inputs">
                <div id="monthly-dropdown" class="dropdown-container" style="display: none;">
                    <input type="hidden" name="type" value="monthly">
                    <input type="month" name="monthInput" id="monthInput" required>
                    <button type="submit" class="submit-btn">Generate Monthly Report</button>
                </div>
            </div>
        </form>

        <form method="get" action="${pageContext.request.contextPath}/ReportServlet" id="yearlyForm">
            <div class="report-buttons">
                <button type="button" onclick="toggleDropdown('yearly')">Yearly Sales</button>
            </div>
            <div class="dropdown-inputs">
                <div id="yearly-dropdown" class="dropdown-container" style="display: none;">
                    <input type="hidden" name="type" value="yearly">
                    <select name="year" required></select>
                    <button type="submit" class="submit-btn">Generate Yearly Report</button>
                </div>
            </div>
        </form>

    </div>

    <%
        String reportType = (String) request.getAttribute("reportType");
        List<Map<String, Object>> reportData = (List<Map<String, Object>>) request.getAttribute("reportData");

        if (reportData == null || reportData.isEmpty()) {
    %>
        <p>No data available for this report.</p>
    <%
        } else {
    %>
        <table border="1" cellpadding="8">
            <thead>
            <tr>
    <%
                Map<String, Object> firstRow = reportData.get(0);
                for (String column : firstRow.keySet()) {
    %>
                <th><%= column %></th>
    <%
                }
    %>
            </tr>
            </thead>
            <tbody>
    <%
            for (Map<String, Object> row : reportData) {
    %>
            <tr>
    <%
                for (Object value : row.values()) {
    %>
                <td><%= value %></td>
    <%
                }
    %>
            </tr>
    <%
            }
    %>
            </tbody>
        </table>
    <%
        }
    %>

    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const today = new Date();
        const todayMonth = today.toISOString().slice(0, 7);
        const todayDate = today.toISOString().split('T')[0];

        const dateInput = document.querySelector('#dailyForm input[type="date"]');
        const monthInput = document.getElementById('monthInput');
        const yearSelect = document.querySelector('#yearlyForm select');

        function loadDateRange(callback) {
            fetch('${pageContext.request.contextPath}/ReportServlet?type=dateRange')
                .then(response => response.json())
                .then(data => callback(data.data))
                .catch(err => console.error('Error:', err));
        }

        window.toggleDropdown = function(type) {
            document.getElementById('daily-dropdown').style.display = 'none';
            document.getElementById('monthly-dropdown').style.display = 'none';
            document.getElementById('yearly-dropdown').style.display = 'none';

            if (type === 'daily') {
                document.getElementById('daily-dropdown').style.display = 'block';
                loadDateRange(minDate => {
                    dateInput.min = minDate;
                    dateInput.max = todayDate;
                });
            }

            if (type === 'monthly') {
                document.getElementById('monthly-dropdown').style.display = 'block';
                loadDateRange(minDate => {
                    monthInput.min = minDate.slice(0, 7);
                    monthInput.max = todayMonth;
                });
            }

            if (type === 'yearly') {
                document.getElementById('yearly-dropdown').style.display = 'block';
                loadDateRange(minDate => {
                    const minYear = new Date(minDate).getFullYear();
                    const currentYear = today.getFullYear();
                    yearSelect.innerHTML = '';
                    for (let y = currentYear; y >= minYear; y--) {
                        const opt = document.createElement('option');
                        opt.value = y;
                        opt.textContent = y;
                        yearSelect.appendChild(opt);
                    }
                });
            }
        };
    });
    </script>
    </body>
    </html>
