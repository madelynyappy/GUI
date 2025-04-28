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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            display: flex;
            min-height: 100vh;
        }

#sidebar {
    width: 250px;
    transition: margin-left 0.3s;
    margin-left: 0;
}

#sidebar.collapsed {
    margin-left: -250px;
}

#content {
    margin-left: 250px;
    transition: margin-left 0.3s;
    width: 100%;
}

.sidebar-collapsed #content {
    margin-left: 0;
}

    </style>
</head>
<body class="sb-nav-fixed">

    <!-- Sidebar included here -->
    <jsp:include page="sidebar.jsp"/>

    <!-- Main Content Wrapper -->
    <div id="content" class="flex-grow-1 w-100">
        <!-- Top Navigation -->
        <nav class="navbar navbar-expand navbar-dark bg-dark">
            <button class="btn btn-link btn-sm me-4" id="sidebarToggle">
                <i class="fas fa-bars text-white"></i>
            </button>
            <a class="navbar-brand text-white" href="#">FITHUB Management</a>

            <ul class="navbar-nav ms-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" id="userDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user fa-fw"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="#">Profile</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <!-- Main Content Area -->
        <div class="container-fluid mt-4">
            <h1 class="h3">Main Content Goes Here</h1>
        </div>
    </div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    const toggleBtn = document.getElementById("sidebarToggle");
    const sidebar = document.getElementById("sidebar");
    const body = document.body;

    toggleBtn.addEventListener("click", function () {
        sidebar.classList.toggle("collapsed");
        body.classList.toggle("sidebar-collapsed");
    });
</script>
</body>
</html>

