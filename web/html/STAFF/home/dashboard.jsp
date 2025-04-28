<%-- 
    Document   : dashboard
    Created on : Apr 22, 2025, 5:18:10 PM
    Author     : Madelyn Yap
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UiUxOtor ERP System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            display: flex;
            background-color: #f5f7fb;
        }
        
        .sidebar {
            width: 230px;
            background-color: white;
            height: 100vh;
            padding: 20px 0;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
            position: fixed;
        }
        
        .logo {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .logo img {
            width: 60px;
            height: 60px;
        }
        
        .logo-text {
            font-weight: bold;
            margin-top: 5px;
            color: #333;
        }
        
        .logo-subtext {
            font-size: 12px;
            color: #666;
        }
        
        .menu-item {
            display: flex;
            align-items: center;
            padding: 12px 25px;
            color: #555;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .menu-item:hover {
            background-color: #f0f4ff;
            color: #3366ff;
        }
        
        .menu-item.active {
            background-color: #e6edff;
            color: #3366ff;
            border-left: 3px solid #3366ff;
        }
        
        .menu-item i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .main-content {
            margin-left: 230px;
            padding: 20px;
            width: calc(100% - 230px);
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .welcome {
            display: flex;
            flex-direction: column;
        }
        
        .welcome h1 {
            font-size: 24px;
            display: flex;
            align-items: center;
        }
        
        .welcome h1 img {
            width: 24px;
            margin-left: 10px;
        }
        
        .welcome p {
            color: #666;
            font-size: 14px;
        }
        
        .user-profile {
            display: flex;
            align-items: center;
            background-color: white;
            padding: 8px 15px;
            border-radius: 50px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
        
        .notification {
            margin-right: 15px;
            position: relative;
            cursor: pointer;
        }
        
        .user-info {
            display: flex;
            align-items: center;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }
        
        .user-name {
            font-weight: 500;
        }
        
        .user-role {
            font-size: 12px;
            color: #666;
        }
        
        .dropdown {
            margin-left: 10px;
            cursor: pointer;
        }
        
        .stats-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            display: flex;
            justify-content: space-between;
        }
        
        .stat-info h2 {
            font-size: 28px;
            margin-bottom: 5px;
        }
        
        .stat-info p {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
        }
        
        .stat-change {
            font-size: 12px;
            display: flex;
            align-items: center;
        }
        
        .stat-change.increase {
            color: #4CAF50;
        }
        
        .stat-change.decrease {
            color: #F44336;
        }
        
        .stat-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .icon-staff {
            background-color: #FFF3E0;
            color: #FF9800;
        }
        
        .icon-application {
            background-color: #E3F2FD;
            color: #2196F3;
        }
        
        .icon-projects {
            background-color: #F3E5F5;
            color: #9C27B0;
        }
        
        .icon-departments {
            background-color: #E8F5E9;
            color: #4CAF50;
        }
        
        .content-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }
        
        .card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
        }
        
        .card h2 {
            margin-bottom: 20px;
            font-size: 20px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th {
            text-align: left;
            padding: 10px;
            font-weight: 500;
            color: #666;
            border-bottom: 1px solid #eee;
        }
        
        td {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        
        .status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .status.pending {
            background-color: #FFF3E0;
            color: #FF9800;
        }
        
        .status.approved {
            background-color: #E8F5E9;
            color: #4CAF50;
        }
        
        .status-bar {
            width: 4px;
            height: 20px;
            border-radius: 2px;
            display: inline-block;
        }
        
        .status-bar.pending {
            background-color: #FF9800;
        }
        
        .status-bar.approved {
            background-color: #4CAF50;
        }
        
        .applications-card {
            display: flex;
            flex-direction: column;
        }
        
        .applications-total {
            font-size: 18px;
            font-weight: 600;
            margin: 20px 0;
        }
        
        .chart-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 200px;
        }
        
        .donut-chart {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: conic-gradient(
                #4CAF50 0% 74%,
                #FF9800 74% 90%,
                #F44336 90% 100%
            );
            position: relative;
        }
        
        .donut-hole {
            position: absolute;
            width: 90px;
            height: 90px;
            background-color: white;
            border-radius: 50%;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        
        .legend {
            display: flex;
            flex-direction: column;
            margin-left: 30px;
        }
        
        .legend-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .legend-color {
            width: 15px;
            height: 15px;
            border-radius: 3px;
            margin-right: 10px;
        }
        
        .legend-color.approved {
            background-color: #4CAF50;
        }
        
        .legend-color.pending {
            background-color: #FF9800;
        }
        
        .legend-color.rejected {
            background-color: #F44336;
        }
        
        .legend-text {
            font-size: 14px;
        }
        
        .legend-count {
            font-weight: 600;
            margin-right: 5px;
        }
        
        footer {
            text-align: center;
            color: #666;
            font-size: 12px;
            margin-top: 20px;
            padding: 20px 0;
        }
    </style>
</head>
<body>

    
    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div class="welcome">
                <h1>Welcome, Mr. Otor John <span style="margin-left: 10px;">?</span></h1>
                <p>Today is Saturday, 11th November 2022.</p>
            </div>
            
            <div class="user-profile">
                <div class="notification">
                    <i class="fas fa-bell"></i>
                </div>
                <div class="user-info">
                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="User Avatar" class="user-avatar">
                    <div>
                        <div class="user-name">Otor John</div>
                        <div class="user-role">HR Office</div>
                    </div>
                </div>
                <div class="dropdown">
                    <i class="fas fa-chevron-down"></i>
                </div>
            </div>
        </div>
        
        <!-- Stats -->
        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-info">
                    <h2>250</h2>
                    <p>Total number of staff</p>
                    <div class="stat-change increase">
                        <i class="fas fa-arrow-up"></i>
                        12 more than last quarter
                    </div>
                </div>
                <div class="stat-icon icon-staff">
                    <i class="fas fa-users"></i>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-info">
                    <h2>100</h2>
                    <p>Total application</p>
                    <div class="stat-change decrease">
                        <i class="fas fa-arrow-down"></i>
                        0.2% lower than last quarter
                    </div>
                </div>
                <div class="stat-icon icon-application">
                    <i class="fas fa-file-alt"></i>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-info">
                    <h2>10</h2>
                    <p>Total projects</p>
                    <div class="stat-change increase">
                        <i class="fas fa-arrow-up"></i>
                        2% more than last quarter
                    </div>
                </div>
                <div class="stat-icon icon-projects">
                    <i class="fas fa-project-diagram"></i>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-info">
                    <h2>10</h2>
                    <p>Total departments</p>
                    <div class="stat-change">
                        <i class="fas fa-minus"></i>
                        Same as last quarter
                    </div>
                </div>
                <div class="stat-icon icon-departments">
                    <i class="fas fa-sitemap"></i>
                </div>
            </div>
        </div>
        
        <!-- Content Grid -->
        <div class="content-grid">
            <!-- Memo Section -->
            <div class="card">
                <h2>Memo</h2>
                <table>
                    <thead>
                        <tr>
                            <th>S/N</th>
                            <th>Memo Title</th>
                            <th>Sent From</th>
                            <th>Sent To</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>01</td>
                            <td>Operations memo</td>
                            <td>Otor John</td>
                            <td>Ibrahim Sadiq</td>
                            <td><span class="status pending">Pending</span></td>
                            <td><span class="status-bar pending"></span></td>
                        </tr>
                        <tr>
                            <td>02</td>
                            <td>Operations project memo</td>
                            <td>Fatima Faruk</td>
                            <td>Shola Abiola</td>
                            <td><span class="status approved">Approved</span></td>
                            <td><span class="status-bar approved"></span></td>
                        </tr>
                        <tr>
                            <td>03</td>
                            <td>Project onboard notice</td>
                            <td>Otor John</td>
                            <td>James Emeka</td>
                            <td><span class="status approved">Approved</span></td>
                            <td><span class="status-bar approved"></span></td>
                        </tr>
                        <tr>
                            <td>04</td>
                            <td>Operations memo</td>
                            <td>Ibrahim Musa</td>
                            <td>Otor John</td>
                            <td><span class="status approved">Approved</span></td>
                            <td><span class="status-bar approved"></span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <!-- Staff List -->
            <div class="card">
                <h2>Staff List</h2>
                <table>
                    <thead>
                        <tr>
                            <th>S/N</th>
                            <th>Staff Name</th>
                            <th>Staff Role</th>
                            <th>Designation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>01</td>
                            <td>Abubakar Ismaila Goje</td>
                            <td>Admin</td>
                            <td>Human Resource Dept.</td>
                            <td><span class="status-bar approved"></span></td>
                        </tr>
                        <tr>
                            <td>02</td>
                            <td>Ifeanyi Obinna</td>
                            <td>Admin</td>
                            <td>Management</td>
                            <td><span class="status-bar approved"></span></td>
                        </tr>
                        <tr>
                            <td>03</td>
                            <td>Bankole Olanrewaju</td>
                            <td>HOD IT</td>
                            <td>Peoples and Operation</td>
                            <td><span class="status-bar approved"></span></td>
                        </tr>
                        <tr>
                            <td>04</td>
                            <td>Chidinma Ebere</td>
                            <td>HOD Account</td>
                            <td>Accounts</td>
                            <td><span class="status-bar approved"></span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <!-- Payment Vouchers -->
            <div class="card">
                <h2>Payment Vouchers</h2>
                <table>
                    <thead>
                        <tr>
                            <th>S/N</th>
                            <th>Subject</th>
                            <th>Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>01</td>
                            <td>Request for FARS for October 2022</td>
                            <td>25/01/2023</td>
                            <td><span class="status pending">Pending</span></td>
                            <td><span class="status-bar pending"></span></td>
                        </tr>
                        <tr>
                            <td>02</td>
                            <td>Request for project proposal fee</td>
                            <td>19/01/2023</td>
                            <td><span class="status approved">Approved</span></td>
                            <td><span class="status-bar approved"></span></td>
                        </tr>
                        <tr>
                            <td>03</td>
                            <td>Request for FARS for October 2022</td>
                            <td>10/01/2023</td>
                            <td><span class="status approved">Approved</span></td>
                            <td><span class="status-bar approved"></span></td>
                        </tr>
                        <tr>
                            <td>04</td>
                            <td>Request for project proposal fee</td>
                            <td>03/01/2023</td>
                            <td><span class="status pending">Pending</span></td>
                            <td><span class="status-bar pending"></span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <!-- Staff Applications Card -->
            <div class="card applications-card">
                <h2>Staff Applications Card</h2>
                <div class="applications-total">500 Total applications</div>
                
                <div class="chart-container">
                    <div class="donut-chart">
                        <div class="donut-hole"></div>
                    </div>
                    
                    <div class="legend">
                        <div class="legend-item">
                            <div class="legend-color pending"></div>
                            <div class="legend-text">
                                <span class="legend-count">80</span>Pending
                            </div>
                        </div>
                        <div class="legend-item">
                            <div class="legend-color approved"></div>
                            <div class="legend-text">
                                <span class="legend-count">370</span>Approved
                            </div>
                        </div>
                        <div class="legend-item">
                            <div class="legend-color rejected"></div>
                            <div class="legend-text">
                                <span class="legend-count">50</span>Rejected
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>