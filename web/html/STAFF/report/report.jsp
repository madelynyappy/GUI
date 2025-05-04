<%-- 
    Document   : report
    Created on : May 02, 2025, 5:03:46 PM
    Author     : Madelyn Yap
--%>   
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>FitHub | Sales Report</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/report.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/staffIcon.jpg">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #F5F7FA;
            margin: 0;
        }

        .sidebar {
            width: 250px;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            background-color: #1f3a5f;
            overflow-y: auto;
        }

        .content {
            margin-left: 250px;
            padding: 40px;
            box-sizing: border-box;
        }

        h1 {
            color: #30588C;
            text-align: center;
            margin-bottom: 30px;
        }

        .button-group {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
        }

        .report-buttons button,
        .submit-btn {
            background-color: #30588C;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            min-width: 180px;
        }

        .submit-btn {
            background-color: #6093BF;
            margin-top: 10px;
        }

        .report-buttons button:hover,
        .submit-btn:hover {
            background-color: #254559;
        }

        .dropdown-inputs {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .dropdown-container {
            background-color: #f9f9f9;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.05);
            margin-top: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        th {
            background-color: #30588C;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #d2dbe8;
            text-align: left;
        }

        tr:hover td {
            background-color: #E0E7F1;
        }

        .no-data {
            text-align: center;
            margin-top: 100px;
            font-size: 16px;
            color: #444;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <jsp:include page="../home/managerSidebar.jsp" />
</div>

<div class="content">
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
    <div class="no-data">
        <p>No data available for this report.</p>
        <p>Please select another option to view the reports.</p>
    </div>
    <%
        } else {
    %>
    <table>
        <thead>
        <tr>
            <th>NO.</th>
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
            int index = 1;
            for (Map<String, Object> row : reportData) {
        %>
        <tr>
            <td><%= index++ %></td>
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
</div>

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

        window.toggleDropdown = function (type) {
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
