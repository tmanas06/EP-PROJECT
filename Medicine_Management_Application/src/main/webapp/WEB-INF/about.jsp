<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>About Us</title>
    <style>
        @font-face {
            font-family: 'Nobility';
            src: url('../fonts/NobilityCasual-pZdR.ttf') format('truetype');
        }
        @font-face {
            font-family: 'sp';
            src: url('../fonts/SpButchLiteBold-8O88B.otf') format('truetype');
        }
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --text-color: #333;
            --background-color: #f4f7f9;
            --content-background: rgba(255, 255, 255, 0.8);
            --blur-effect: blur(10px);
            --card-gradient: linear-gradient(135deg, #e0f7fa, #f1f8e9);
            --navbar-gradient: linear-gradient(90deg, #3498db, #2ecc71);
            --button-gradient: linear-gradient(135deg, #6dd5ed, #2193b0);
        }
        .dark-mode {
            --primary-color: #2980b9;
            --secondary-color: #27ae60;
            --text-color: #e0e0e0;
            --background-color: #1a1a1a;
            --content-background: rgba(44, 44, 44, 0.8);
            --blur-effect: blur(15px);
            --card-gradient: linear-gradient(135deg, #263238, #37474f);
            --navbar-gradient: linear-gradient(90deg, #2980b9, #27ae60);
            --button-gradient: linear-gradient(135deg, #3a6186, #89253e);
        }
        body {
            font-family: 'Comfortaa', 'Nanum Gothic', cursive, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            transition: background-color 0.3s, color 0.3s;
        }
        h1 {
            font-family: 'sp', sans-serif;
            color: var(--primary-color);
            font-size: 3rem;
            margin-bottom: 1rem;
            text-align: center;
            background: linear-gradient(90deg, rgba(131,58,180,1) 0%, rgba(253,29,29,1) 50%, rgba(252,176,69,1) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        p {
            background: var(--content-background);
            backdrop-filter: var(--blur-effect);
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin: 50px auto;
            padding: 40px;
            max-width: 600px;
            width: 100%;
            transition: all 0.3s ease-in-out;
        }
        p:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.2);
        }
        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }
            p {
                padding: 25px;
                margin: 20px;
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <h1>About Us</h1>
    <p>Information about our company.</p>
    <script>
        const body = document.body;
        if (localStorage.getItem('darkMode') === 'true') {
            body.classList.add('dark-mode');
        }
    </script>
</body>
</html>