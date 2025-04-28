<%-- 
    Document   : blogList
    Created on : Apr 23, 2025, 12:17:11 AM
    Author     : Madelyn Yap
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Budget - ERP System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: #333;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #eaeaea;
            margin-bottom: 20px;
        }
        
        .logo {
            display: flex;
            align-items: center;
        }
        
        .logo img {
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }
        
        .logo-text {
            display: flex;
            flex-direction: column;
        }
        
        .logo-name {
            font-weight: bold;
            color: #2563eb;
        }
        
        .logo-subtitle {
            font-size: 12px;
            color: #64748b;
        }
        
        .user-profile {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .notification-icon {
            margin-right: 15px;
            cursor: pointer;
        }
        
        .user-info {
            text-align: right;
        }
        
        .user-name {
            font-weight: 500;
        }
        
        .user-role {
            font-size: 12px;
            color: #64748b;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #e5e7eb;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        
        .user-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .page-title {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .page-title h1 {
            font-size: 24px;
            font-weight: bold;
            margin-right: 10px;
            display: flex;
            align-items: center;
        }
        
        .page-title h1 .icon {
            color: #3b82f6;
            margin-right: 8px;
        }
        
        .page-subtitle {
            color: #64748b;
            margin-bottom: 30px;
        }
        
        .back-button {
            display: flex;
            align-items: center;
            color: #3b82f6;
            text-decoration: none;
            margin-bottom: 20px;
        }
        
        .back-button .icon {
            margin-right: 5px;
        }
        
        .form-section {
            background-color: white;
            border-radius: 8px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        
        .form-section h2 {
            font-size: 18px;
            margin-bottom: 15px;
        }
        
        .form-description {
            color: #64748b;
            margin-bottom: 20px;
        }
        
        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        
        .form-group {
            flex: 1;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }
        
        .form-control {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.1);
        }
        
        .date-input {
            position: relative;
        }
        
        .date-input .calendar-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #64748b;
        }
        
        .select-wrapper {
            position: relative;
        }
        
        .select-wrapper::after {
            content: "";
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            width: 0;
            height: 0;
            border-left: 5px solid transparent;
            border-right: 5px solid transparent;
            border-top: 5px solid #64748b;
            pointer-events: none;
        }
        
        .btn {
            padding: 12px 20px;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            font-size: 14px;
        }
        
        .btn-primary {
            background: linear-gradient(to right, #2563eb, #3b82f6);
            color: white;
        }
        
        .btn-primary:hover {
            background: linear-gradient(to right, #1d4ed8, #2563eb);
        }
        
        .table-container {
            overflow-x: auto;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th {
            text-align: left;
            padding: 12px 15px;
            background-color: #f8fafc;
            border-bottom: 1px solid #e2e8f0;
            font-weight: 500;
            color: #64748b;
        }
        
        td {
            padding: 12px 15px;
            border-bottom: 1px solid #e2e8f0;
        }
        
        .text-right {
            text-align: right;
        }
        
        .footer {
            text-align: center;
            padding: 20px 0;
            color: #64748b;
            font-size: 12px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
       
        
        <div class="page-title">
            <h1>
                
                Create Budget
            </h1>
        </div>
        
        <div class="page-subtitle">Create and send budget request.</div>
        

        
        <section class="form-section">
            <h2>Create Budget</h2>
            <p class="form-description">Kindly fill in the form below to create a budget</p>
            
            <form>
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Budget number</label>
                        <input type="text" class="form-control" placeholder="Enter item">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Budget description</label>
                        <input type="text" class="form-control" placeholder="Enter description">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Budget amount</label>
                        <input type="text" class="form-control" placeholder="Enter amount in ?">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Date</label>
                        <div class="date-input">
                            <input type="text" class="form-control" placeholder="DD/MM/YYYY">
                            <span class="calendar-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                            </span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Receiving office</label>
                        <div class="select-wrapper">
                            <select class="form-control">
                                <option value="" disabled selected>Select option</option>
                                <option value="hr">HR Office</option>
                                <option value="finance">Finance Office</option>
                                <option value="admin">Admin Office</option>
                            </select>
                        </div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Create Budget</button>
                    </div>
                </div>
            </form>
        </section>
        
        <section class="form-section">
            <h2>Budget Request</h2>
            
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>S/N</th>
                            <th>Budget No.</th>
                            <th>Budget Description</th>
                            <th>Budget Amount (?)</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>01</td>
                            <td>00211235</td>
                            <td>Purchase of 10 units, 2Hp Hisense Air Conditions</td>
                            <td class="text-right">1,400,000.00</td>
                            <td>18/11/2022</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <div class="form-row" style="margin-top: 20px;">
                <div class="form-group">
                    <button type="button" class="btn btn-primary">Submit for Approval</button>
                </div>
            </div>
        </section>
        

    </div>
</body>
</html>
