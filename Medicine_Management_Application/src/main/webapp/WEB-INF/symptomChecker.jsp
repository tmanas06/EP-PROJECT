<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Symptom Checker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Inline CSS for Styling the Symptom Checker Page -->
    <style>
        /* General reset */
        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f3f9ff;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
        }

        h1 {
            font-size: 2.2rem;
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
        }

        form {
            width: 100%;
            max-width: 500px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 10px;
            display: block;
        }

        textarea {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            border: 1px solid #ccc;
            resize: vertical;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <h1>Symptom Checker</h1>
    <form action="checkSymptoms" method="post">
        <label for="symptoms">Enter your symptoms:</label><br/>
        <textarea id="symptoms" name="symptoms" rows="4" cols="50"></textarea><br/>
        <input type="submit" value="Check Symptoms">
    </form>
</body>
</html>
