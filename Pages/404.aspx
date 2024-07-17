<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="LoseAndFind._404" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    
    <link rel="stylesheet" href="~/LoseAndFind.styles.css" asp-append-version="true" />
    <title>Страница не найдена</title>
    <style>
        .error-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        h1 {
            font-size: 50px;
            margin-bottom: 20px;
        }
        p {
            font-size: 20px;
            margin-bottom: 30px;
        }
        a {
            text-decoration: none;
            color: #007BFF;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>404</h1>
        <p>Такой страницы не существует.</p>
        <p>Вернитесь на <a href="http://localhost/Pages/Ads">главную страницу</a>.</p>
    </div>
</body>
</html>