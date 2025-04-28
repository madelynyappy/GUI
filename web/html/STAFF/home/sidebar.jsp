<%-- 
    Document   : sidebar
    Created on : Apr 16, 2025, 11:38:50 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FITHUB STAFF</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .sidebar {
            min-height: 100vh;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div id="sidebar" class="bg-light border-end position-fixed vh-100" style="width: 250px;">
    <div class="sidebar-heading px-3 py-4 fw-bold text-primary">FITHUB Staff</div>

    <div class="list-group list-group-flush">

        <!-- Core Section -->
        <div class="px-3 text-secondary text-uppercase small fw-bold mt-3 mb-2">Core</div>
        <a href="dashboard.jsp" class="list-group-item list-group-item-action bg-light">
            <i class="fas fa-tachometer-alt me-2"></i> Dashboard
        </a>

        <!-- Interface Section -->
        <div class="px-3 text-secondary text-uppercase small fw-bold mt-4 mb-2">Main</div>

        <!-- Layouts Collapse -->
        <a class="list-group-item list-group-item-action bg-light d-flex justify-content-between align-items-center"
           data-bs-toggle="collapse" href="#collapseLayouts" role="button" aria-expanded="false" aria-controls="collapseLayouts">
            <span><i class="fas fa-columns me-2"></i> Products</span>
            <i class="fas fa-angle-right"></i>
        </a>
        <div class="collapse" id="collapseLayouts">
            <div class="bg-white py-1 ps-4">
                <a href="#" class="list-group-item list-group-item-action bg-light border-0">View Product</a>
                <a href="#" class="list-group-item list-group-item-action bg-light border-0">View Orders</a>
                <a href="#" class="list-group-item list-group-item-action bg-light border-0">View Promotion</a>
            </div>
        </div>
        
        <a href="#" class="list-group-item list-group-item-action bg-light">
            <i class="fas fa-chart-area me-2"></i> Blog
        </a>

      

        <!-- Addons Section -->
        <div class="px-3 text-secondary text-uppercase small fw-bold mt-4 mb-2">Addons</div>
        <a href="#" class="list-group-item list-group-item-action bg-light">
            <i class="fas fa-chart-area me-2"></i> Revenue
        </a>
        <a href="#" class="list-group-item list-group-item-action bg-light">
            <i class="fas fa-table me-2"></i>  Staff 
        </a>
        
          <!-- Pages Collapse -->
        <a class="list-group-item list-group-item-action bg-light d-flex justify-content-between align-items-center"
           data-bs-toggle="collapse" href="#collapsePages" role="button" aria-expanded="false" aria-controls="collapsePages">
            <span><i class="fas fa-book-open me-2"></i> Customer</span>
            <i class="fas fa-angle-right"></i>
        </a>
        <div class="collapse" id="collapsePages">
            <div class="bg-white py-1 ps-4">
                <a href="#" class="list-group-item list-group-item-action bg-light border-0">View Customer</a>
                <a href="#" class="list-group-item list-group-item-action bg-light border-0">View Ratings</a>
            </div>
        </div>

         
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

