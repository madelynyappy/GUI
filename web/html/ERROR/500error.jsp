<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/error.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png"> 
    <title>500 - Something went wrong on our end</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            text-align: center;
            padding: 40px;
        }
        h1 {
            font-size: 5em;
            color: #30588C;
        }
        h2 {
            color: #6093BF;
        }
        p {
            font-size: 1.2em;
        }
        .container {
            margin-top: 30px;
        }
        .home-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #30588C;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }
        .home-button:hover {
            background-color: #254559;
        }
        .arrow-icon {
            width: 16px;
            height: 16px;
            vertical-align: middle;
            margin-right: 6px;
        }
        img {
            margin-top: 20px;
            max-width: 300px;
        }
    </style>
</head>
<body>
    <h1>500</h1>
    <h2>Internal Server Error</h2>
    <p>Something went wrong on our server.</p>
    <p>We're working to fix the issue. Please try again later.</p>

    <div class="container">
        <img src="${pageContext.request.contextPath}/images/500.png" alt="500 Error" />

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
