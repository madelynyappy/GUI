<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/error.css">
         <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png"> 
        <title>408 - Request Took Too Long</title>
</head>
<body>
    <h1>408</h1>
    <h2>Request Timeout</h2>
    <p>The server timed out waiting for your request.</p>
    <p>Please try again later.</p>
   <div class="container">
        <img src="${pageContext.request.contextPath}/images/408.png" alt="404" />

        <a href="${pageContext.request.contextPath}/html/USER/home/home.jsp" class="home-button">
            <svg class="arrow-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M19 12H5"></path>
                <path d="M12 19l-7-7 7-7"></path>
            </svg>
            Go Home
        </a>
    </div>
</body>
</html>